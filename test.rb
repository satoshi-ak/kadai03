require 'webrick'
server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}
server.mount('/exam', WEBrick::HTTPServlet::ERBHandler, 'exam.html.erb')
server.mount('/indicate.cgi', WEBrick::HTTPServlet::CGIHandler, 'indicate.rb')
server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.rb')
server.mount('/give.cgi', WEBrick::HTTPServlet::CGIHandler, 'give.rb')
server.mount('/false.cgi', WEBrick::HTTPServlet::CGIHandler, 'false.rb')
server.start
