#TUTTO 1
#http://ruby.bastardsbook.com/chapters/html-parsing/

require 'rubygems'
require 'nokogiri' 

#Methode-1
#If the webpage is stored as a file on your hard drive, you can pass it in like so:

page = Nokogiri::HTML(open("index.html"))   
puts page.class   # => Nokogiri::HTML::Document

#Methode-2
#If the webpage is live on a remote site, like http://en.wikipedia.org/, then you'll want to include the open-uri module, which is part of the standard Ruby distribution but must be explicitly required:

require 'open-uri'
   
page = Nokogiri::HTML(open("http://en.wikipedia.org/"))   
puts page.class   # => Nokogiri::HTML::Document

#Methode-3
#You can also use the RestClient gem as we've done before. All the Nokogiri::HTML constructor needs is raw HTML as a string.

require 'restclient'

page = Nokogiri::HTML(RestClient.get("http://en.wikipedia.org/"))   
puts page.class   # => Nokogiri::HTML::Document

#TUTTO 2
#https://www.engineyard.com/blog/getting-started-with-nokogiri

#Parsing HTML documents looks like this:

	doc = Nokogiri::HTML(html_document)

#Parsing XML documents looks like this:

	doc = Nokogiri::XML(xml_document)

#Both of these functions will take an IO object or a String object. Since both forms accept IO objects, we can even feed open-uri straight in to Nokogiri like this:

	doc = Nokogiri::HTML(open("http://www.google.com/search?q=doughnuts"))

#There are three different ways to traverse our in-memory tree. The first two, XPath and CSS, are small languages built specifically for tree traversal. The last one we’ll examine is the Nokogiri API for manual tree traversal.

###Basic XPath

#The XPath language was written to easily traverse an XML tree structure, but we can use it with HTML trees as well. Here’s a sample program for extracting search result links from a google search. We’ll use XPath to find the data we want, and then pick apart the XPath syntax:

	require 'open-uri'
	require 'nokogiri'

	doc = Nokogiri::HTML(open("http://www.google.com/search?q=doughnuts"))
	doc.xpath('//h3/a').each do |node|
	  puts node.text
	end

####Basic CSS

#CSS is similar to XPath in that it’s another language for searching a tree data structure. In this section, we’ll perform the same task as the XPath section, but we’ll examine the CSS syntax.
#CSS does not separate tag matching patterns by slashes, but rather by whitespace or “greater than” characters (actually, there are more, but we’re just going to talk about those two for now). Let’s rewrite our previous XPath as CSS and examine the syntax.

#	//h3/a    …can be written in CSS as: 	h3 > a

###Basic Node API




