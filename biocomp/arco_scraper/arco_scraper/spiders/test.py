from scrapy.spiders import BaseSpider
from scrapy.selector import Selector
from arco_scraper.items import ArcoScraperItem

class MySpider(BaseSpider):
	name = 'arco_pls'
	allowed_domains = ['https://www.ebi.ac.uk/biomodels-main/']
	start_urls = []
	for i in range(583):
		if i < 9:
			i = '00' + str(i+1)
		elif i < 99:
			i = '0' + str(i+1)
		else:
			i = str(i+1)  
		start_urls.append('https://www.ebi.ac.uk/biomodels-main/' + \
			'BIOMD0000000' + i)

	def parse(self, response):
		item = ArcoScraperItem()
		items = []
		hxs = Selector(response)
		item['Publication_ID'] = hxs.xpath('//td[b[text()="Publication ID:"]]/a/text()').extract()[0]
		item['BIO_ID'] = response.url[-15:]
		item['URL'] = response.url
		submission_date = hxs.xpath('//td[b[text()="Submission Date:"]]/text()').extract()[0]
		sub_date = submission_date.split()[1:]
		item['Submission_Date'] = ' '.join(sub_date)
		item['file_urls'] = [response.url[:37] + 'download?mid=' + response.url[37:] + '&format=m-file']
		items.append(item)
		return items
