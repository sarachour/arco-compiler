# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: http://doc.scrapy.org/en/latest/topics/item-pipeline.html
from scrapy.pipelines.files import FilesPipeline
from arco_scraper import settings

     
class MyFilesPipeline(FilesPipeline):
    def file_path(self, request, response=None, info=None):
        media_guid = request.url[50:65]
        return '%s/%s' % (media_guid, media_guid + '.m')


def write_to_csv(item):
    outputfilename = 'Downloads/'+item['BIO_ID'] + '/meta.txt'
    desired_stats = sorted(['Submission_Date', 'BIO_ID', 'Publication_ID', 'URL'])
    f = open(outputfilename, 'wb')
    for i in desired_stats:
        f.write(i +' : '+ item[i] + '\n')
    f.close()


class WriteToCsv(object):
    def process_item(self, item, spider):
        write_to_csv(item)
        return item
