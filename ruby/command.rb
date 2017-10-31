class Request

  # length (4 bytes)
  # id (4 bytes)
  # flags (1 byte)
  # command set (1 byte)
  # command (1 byte)
  # data
  PACK_FMT = 'NNccc'
  HEADER_LEN = 11

  attr_reader :length, :id, :flags, :command_set, :command, :pl

  def initialize(id, command_set, command, pl='')
    @length = HEADER_LEN + pl.size
    @id = id
    @flags = 0
    @command_set = command_set
    @command = command
    @pl = pl
  end

  def encode
    header = [@length, @id, @flags, @command_set, @command].pack(PACK_FMT)
    header + @pl
  end

  def self.decode(pl)
    r = Request.new(pl.unpack(PACK_FMT))
    r
  end

end

class Response

  # length (4 bytes)
  # id (4 bytes)
  # flags (1 byte)
  # error code (2 bytes)
  PACK_FMT = 'NNcn'
  HEADER_LEN = 11

  attr_reader :length, :id, :flags, :error, :pl

  def initialize(header)
    @length, @id, @flags, @error = header.unpack(PACK_FMT)
    @pl = yield @length - HEADER_LEN
  end

  def inspect
    pl = @pl.inspect
    "Response(length=#@length id=#@id flags=#@flags error=#@error pl=#{pl})"
  end

end
