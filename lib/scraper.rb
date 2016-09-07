require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

	def self.start_scrape(index_url)
		html = open(index_url)
		index = Nokogiri::HTML(html)
	end

	def self.scrape_categories(index_url)
		index = self.start_scrape(index_url)
		self.compile_categories(index)
	end

	#helper methods for self.scrape_categories

	def self.get_category_list(index)
		category_list = []
		groups = index.css('nav.global-navigation div.subnav.subnav-podcast-categories div.group')
		categories = groups.each do |group|
			names = group.css('ul li')
			names.each {|category| category_list << category.css('a').text}
		end
		category_list
	end

	def self.get_category_urls(index)
		category_links = []
		groups = index.css('nav.global-navigation div.subnav.subnav-podcast-categories div.group')
		categories = groups.each do |group|
			links = group.css('ul li')
			links.each {|category| category_links << "http://www.npr.org" + category.css('a').attribute('href').value}
		end
		category_links
	end

	def self.compile_categories(index)
		category_names = self.get_category_list(index)
		category_urls = self.get_category_urls(index)
		count = 0
		categories = []
		until count == category_names.size - 1
			category = {
				:name => category_names[count],
				:url => category_urls[count]
			}
			categories << category
			count += 1
		end
		categories
	end

	# podcast scraping

	def self.scrape_podcasts(category_url)
		category = self.start_scrape(category_url)
		self.get_podcast_data(category)
	end

	#helper methods for podcast scraping

	def self.get_podcast_data(category)
		podcasts = category.css('section#podcast-section-core article.podcast-active')
	end


end
