#!/usr/bin/env ruby

require 'json'

$lines = File.readlines(ARGV[0] || 'tools/jdwp-protocol.html')

def strip_doc(d)
  d.gsub(/&nbsp;/, ' ').strip.gsub(/<a href.*?<\/a>/, '')
end

js = {
  'command_sets' => [],
  'constant_sets' => [],
}

mode = nil
cmdset_js = nil
rec_num = nil
cmd = nil
constants = nil
commands = [nil, nil, nil]

$lines.each do |line|
  if /^<h4>.*>(\w+) Constants<\/a>/ =~ line
    mode = :constants
    constants = []
    js['constant_sets'] << {
      'name' => $1,
      'constants' => constants,
    }
  elsif mode == :constants
    if /^<tr><td>(\w+)<td>([x\h]+)<td>(.*)/ =~ line
      error_name = $1
      error_id = $2.to_i
      error_doc = $3
      error_doc = strip_doc(error_doc)
      STDERR.puts "#{error_name} #{error_id} #{error_doc}"
      #constants << [error_name, error_id, error_doc]
      constants << {
        'name' => error_name,
        'id' => error_id,
        'doc' => error_doc,
      }
    end
  else
    if /^<h4>.*>(\S+) Command Set.*\((\d+)\)/ =~ line
      cmdset_name = $1
      cmdset_id = $2.to_i
      STDERR.puts "cmdset: #{cmdset_name} #{cmdset_id}"

      cmdset_js = {
        'name' => cmdset_name,
        'id' => cmdset_id,
        'commands' => [],
      }
      commands[1] = commands[2] = nil
      js['command_sets'] << cmdset_js
    elsif /^<h5>.*>(\S+) Command<.*\((\d+)\)/ =~ line
      cmd_name = $1
      cmd_id = $2.to_i
      STDERR.puts "cmd: #{cmd_name} #{cmd_id}"

      cmd = {
        'name' => cmd_name,
        'id' => cmd_id,
        'outputs' => [],
        'replies' => [],
        'errors' => [],
      }
      cmdset_js['commands'] << cmd
    elsif /^<dt>Out Data/ =~ line
      commands[0] = cmd['outputs']
    elsif /^<dt>Reply Data/ =~ line
      commands[0] = cmd['replies']
    elsif /^<dt>Error Data/ =~ line
      commands[0] = cmd['errors']
      rec_num = 0
    elsif /^<dt>Event Data/ =~ line
      commands[0] = cmd['events'] = []
    elsif /^Repeated <i>(\w+)<\/i> times:/ =~ line
      STDERR.puts "repeat: #{$1}"
      last_cmd = commands[rec_num][-1]
      raise if last_cmd['name'] != $1
      last_cmd['repeated'] = commands[rec_num+1] = []
    elsif /^Case (\w+) - if <i>(\w+)<\/i> is (.*?):/ =~ line
      STDERR.puts "case: #{$1} #{$2} #{$3}"
      case_name = $1
      case_target = $2
      case_value = $3
      last_cmd = commands[1][-1]
      raise if last_cmd['name'] != case_target
      last_cmd['cases'] ||= []
      union = []
      last_cmd['cases'] << {
        'name' => case_name,
        'target' => case_target,
        'value' => case_value,
        'union' => union
      }
      commands[2] = union
    elsif /^(\w+|tagged-objectID)<td><i>(\w+).*<td>(.*)/ =~ line
      data_type = $1
      data_name = $2
      data_doc = $3
      data_doc = strip_doc(data_doc)
      STDERR.puts "#{mode}: #{data_type} #{data_name} #{data_doc} #{rec_num}"
      commands[rec_num] << {
        'type' => data_type,
        'name' => data_name,
        'doc' => data_doc,
      }
    elsif /^<tr><td>.*?Error_(\w+)">/ =~ line
      STDERR.puts "#{mode}: #{$1}"
      commands[rec_num] << $1
    elsif /^<td colspan=(\d)>/ =~ line
      colspan = $1.to_i
      if colspan == 5 || colspan == 4 || colspan == 3
        rec_num = 5 - colspan
      end
    end
  end
end

puts JSON.dump(js)
