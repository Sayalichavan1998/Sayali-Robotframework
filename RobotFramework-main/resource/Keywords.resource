*** Settings ***
Resource    Resource.resource


*** Variables ***

${ChromedriverPath}    E:\Learning\PycharmProjects\RobotFramework\config\chromedriver
${AmazonURL}        https://www.amazon.in/

*** Keywords ***

Wait and Click
    [Arguments]    ${Xpath}
    Wait Until Page Contains Element    ${Xpath}
    Click Element    ${Xpath}
    
Wait and Input 
    [Arguments]    ${Xpath}
    Wait Until Page Contains Element    ${Xpath}
    Input Text    ${Xpath}    ${text}

setup driver and path for chrome and open URL
    [Documentation]    setups the executable path and assigns the URL
    [Arguments]    ${URL}=${AmazonURL}    ${Driver path}=${ChromedriverPath}
    Open Browser   browser=Chrome    options= add_experimental_option("detach",True)
    Go To    ${URL}
    Maximize Browser Window

Open Browser with Amazon URL
    [Documentation]    Opens the Amazon URL
    [Arguments]    ${URL}=${AmazonURL}
    setup driver and path for chrome and open URL    ${URL}


Search for non existing Products
    [Documentation]    Searches for the products  that does not contains
    Set Selenium Implicit Wait    10
    Input Text    ${SearchBox_Loc}     ;akjhvesgjdgvh.
    Wait And Click    ${SearchButton_Loc}
    Page Should Contain    No results for
    Capture Page Screenshot    No results found.png


Search for the existing Product
    [Documentation]    Searches for the Product
    Set Selenium Implicit Wait    10
    Input Text   ${SearchBox_Loc}        Laptop
    Wait Until Page Contains Element    //div[@class='left-pane-results-container']
    Wait And Click    ${SearchButton_Loc}
    Capture Page Screenshot    Elementsearched.png


Validate the Product and add to cart
    [Documentation]  Validates the Product and add to cart
    Set Selenium Implicit Wait    10
    ${All_res_Value_Loc}    Get Text    ${AllResults_Loc}
    ${All_res_Value_str}    Convert To String    ${All_res_Value_Loc}
    Wait And Click    ${AllResults_Loc}
    ${WindowHandles}    Get Window Handles
    ${Product_Window}    Get From List    ${WindowHandles}     1
    Switch Window    ${Product_Window}
    ${Product_Value_Loc}    Get Text    ${ProductLoc}
    ${Product_Value_str}    Convert To String    ${Product_Value_Loc}
    Capture Page Screenshot    Product page.png
    Run Keyword If    '${All_res_Value_str}'=='${Product_Value_str}'    Add products to the cart and delete


Add products to the cart and delete
    [Documentation]    Add products to the cart and delete
    Set Selenium Implicit Wait    10
    Wait And Click    ${AddToCartButton_Loc}
    Wait And Click    ${ViewCart_Loc}
    Capture Page Screenshot    Added to cart.png
    Wait And Click    ${ViewCart_Loc}
    Wait And Click    ${QtyDDValue_Loc}
    Capture Page Screenshot    Deleted from cart.png


Download and verify the bill
    [Documentation]    Downloads and verify the bill for older orders
    Set Selenium Implicit Wait    10
    Mouse Over    //div[contains(text(),'Sayali')]
    Wait And Click    //a[@title='Orders']
    @{allOrders}     Get WebElements        //div[@class='col-8-12']
    For    ${element} in  @{allOrders}:
        ${text}    Get Element Text    ${element}
        Log To Console   ${text}


    
filter product according to the user
    Set Selenium Implicit Wait    10
    Wait Until Page Contains Element    ${StorageSizeLoc}
    Scroll Element Into View            ${StorageSizeLoc}
    ${ele}    Get Webelement            ${StorageSizeLoc}
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${ele}
    Wait And Click    //span[contains(text(),'Apple iPhone 13 (256GB) - Midnight')]
    Get Window Titles
    ${handles}=    Get Window Handles
    Switch Window	${handles}[1]
    Wait Until Page Contains Element    //h1[@id='title']/span[contains(text(),'Apple iPhone 13 (256GB) - Midnight')]
    Capture Page Screenshot    Products seen.png
    ${FetchPrice}    Get Element Text    //div[@id='corePriceDisplay_desktop_feature_div']/div/span/span/span[@class='a-price-whole']
