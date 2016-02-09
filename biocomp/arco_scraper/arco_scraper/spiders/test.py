from scrapy.spiders import BaseSpider
from scrapy.selector import Selector
from arco_scraper.items import ArcoScraperItem
from scrapy.http import Request


items = []
class MySpider(BaseSpider):
    name = 'arco_pls'
    allowed_domains = ['https://www.ebi.ac.uk/biomodels-main/', 'europepmc.org/']
    start_urls = []
    for i in range(5):
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
        item['Next_URL'] = hxs.xpath('//td[b[text()="Publication ID:"]]/a/@href').extract()[0]
        request = Request(item['Next_URL'], callback=self.parse_2, dont_filter=True)
        request.meta['item'] = item
        items.append(item)
        return items
        # yield request
        # yield items
        # for url in response.xpath('//*[@id="tbl_model"]/tbody/tr[2]/td[1]/table/tbody/tr/td/a/@href').extract():
        

        # items.append(item)
        # return items

    def parse_2(self, response2):
        # items = []

        hxsn = Selector(response2)
        item = response2.meta['item']
        print '-----------------123'
        print item
        print '-----------------456'
        # item['Test_Attribute'] = hxsn.xpath('//div[class="abs_affiliation resultsGrey"]/text()').extract()
        
        # items.append(item)
        next(parse)
        # return items

