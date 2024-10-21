*** Settings ***
Resource    ../resource/Resource.resource
*** Test Cases ***
Automate the Amazon shopping page
    [Documentation]  Automate the Amazon shopping page and places Order
    [Tags]    TC01
    Open Browser with Amazon URL
    #Search for non existing Products
    Search for the existing Product
    Validate the Product and add to cart
    #filter product according to the user
    #Select Product as per the userdata
   # Download and verify the bill


    

