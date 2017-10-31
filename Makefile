all: ruby/gen_client.rb test/debuggee.class
	ruby -Iruby test/jdwp.rb
	ruby -Iruby test/java.rb

test/debuggee.class: test/debuggee.java
	javac $<

ruby/gen_client.rb: tools/gen_code.rb tools/jdwp-protocol.json
	ruby $< > $@.tmp && mv $@.tmp $@

tools/jdwp-protocol.json: tools/parse_doc.rb tools/jdwp-protocol.html
	ruby $< > $@.tmp && mv $@.tmp $@
