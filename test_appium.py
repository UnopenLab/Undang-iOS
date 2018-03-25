# -*- coding: utf-8 -*-
#iOS environment
import unittest
from appium import webdriver

desired_caps = {
	"platformName" : "iOS",
	"platformVersion" : "11.2",
	"deviceName" : "iPhone SE",
	"app" : "/Users/Jungin/Library/Developer/Xcode/DerivedData/Undang-eyvfnkzjzmxlqebazqxtenjcakpn"
}

def test_undang():
	driver = webdriver.Remote('http://0.0.0.0:4723/wd/hub',desired_caps)
	driver.switch_to.context('WEBVIEW')

	assert '지금 한강은' in driver.page_source
	driver.quit()
