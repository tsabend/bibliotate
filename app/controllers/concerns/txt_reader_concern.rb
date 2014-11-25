module TxtReaderConcern
  def read(file)
    return nil unless file
    body = File.open(file, 'r')
    body.read
  end
end