# import rest-client gem
require 'rest-client'

# search google
def search_google param
  begin 
    @response = RestClient.get "https://www.google.com/search", { :param => { :q => param} } 
  # print the response code when RestClient returns with exception
  rescue RestClient::ExceptionWithResponse => e
    puts "Response code: #{e.message}"
  end
end

def print_response
   puts "Response code: #{@response.code}"
   puts "Response headers: #{@response.headers}"
   puts "Response cookies: #{@response.cookies}"
   puts "Response body: #{@response.to_str}"
end

def output
  puts "RestCLient (GoogleSearch functionaliy as of the moment)"
  print "Enter Google search query: "

  phrase = gets.chomp.split.join("+")
  search_google(phrase)
end

output
print_response if !@response.empty?
