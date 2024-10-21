*** Settings ***

*** Variables ***
${SearchBox_Loc}    xpath=//input[@id='twotabsearchtextbox']
${SearchButton_Loc}    xpath=//input[@id='nav-search-submit-button']
${AllResults_Loc}        xpath=//span[@class='a-size-medium a-color-base a-text-normal']
${ProductLoc}        xpath=//span[@id='productTitle']
${AddToCartButton_Loc}    xpath=//*[@id="add-to-cart-button"]
${ViewCart_Loc}        xpath=//*[@id="attach-sidesheet-view-cart-button"]/span/input
${Qty_Loc}        xpath=//span[@class='a-button-text a-declarative']
${QtyDDValue_Loc}        xpath=//a[@id='quantity_0']