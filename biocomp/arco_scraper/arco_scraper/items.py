# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/en/latest/topics/items.html

import scrapy

class ArcoScraperItem(scrapy.Item):
    # define the fields for your item here like:
    Publication_ID = scrapy.Field() # DONE
    BIO_ID = scrapy.Field() # DONE
    URL = scrapy.Field() # DONE
    Submission_Date = scrapy.Field() # DONE
    Next_URL = scrapy.Field()
    Test_Attribute = scrapy.Field() # DELETE ONCE YOU KNOW IT WORKS
    problem_size = scrapy.Field() #MIGHT HAVE TO DO SOME POST PROCESSING FOR THIS PART
    number_of_citations = scrapy.Field() # SECOND SPIDER NEEDED
    bibtex_citation = scrapy.Field() # SECOND SPIDER NEEDED
    file_urls = scrapy.Field()  # DON'T TOUCH, NECESSARY FOR FILE DOWNLOAD
    files = scrapy.Field() # SAME AS ABOVE