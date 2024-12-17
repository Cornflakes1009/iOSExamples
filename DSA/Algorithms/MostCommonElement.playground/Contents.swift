import UIKit
let networkManagerArray = ["NetworkManager", "mobileAccessCheck", "getShippingMethods", "getCustomerShippingAddresses", "getDealerTypes", "getLocationRestrictedSuppliers", "getBranchLocations", "getCustomerAccountList", "getSalesRepAccountList", "getCustomerSalesReps", "getUserInfoFromAccount", "getUpdatedBloomreachRCs", "accountNumberValidation", "newShopperRegistration", "forgotPassword", "getItemDetails", "itemDetailsFromBody", "getImage", "scannedBarcode", "getHealthyAirSolutions", "getLinkImageSectionInfo", "getSupportVideosInfo", "getAllCategoriesImagesOnly", "allCategoriesImagesOnly", "getNewProductsData", "getPriceResultSet", "getStockStatusForItem", "fetchMarketingResourcesData", "fetchMarketingPromotionsData", "fetchTechSupportContacts", "fetchTechTrainingVideos", "fetchWhatsNew", "fetchShoppingLists", "createShoppingList", "deleteShoppingList", "fetchShoppingListItems", "addItemToShoppingList", "updateShoppingList", "updateShoppingListItems", "deleteShoppingListItem", "getLabelPrintPreview", "fetchLabelsPDF", "submitLabelOrder", "addMultipleItemsToList", "fetchHomeViewData", "fetchContactUsData", "fetchContactUsManufacturerData", "sendContactUsMessage", "fetchBusinessTrainingData", "sendFeedbackMessage", "fetchEventsLinksData", "fetchOnboardingData", "fetchPDF", "GreatEscapesNetworkManager", "fetchIncentivePointsDetails", "fetchGreatEscapesIncentivePointsForCustomer", "fetchGreatEscapesData", "fetchProgramInfoDealer", "MoreNetworkManager", "getPublicUtilityRebatesInfo", "getDealerLearningCenterInfo", "getEvent", "getEventAboutInfo", "getEventBooths", "eventInsertCheckin", "getEventSchedule", "getEventTicket", "getEventSpeaker", "getEventVendors", "getExtraFormData", "getDealerPrograms", "getDealerAgreements", "signDealerAgreement", "fetchFormsiteHeadings", "fetchSwoogoEventFormQuestions", "getRegistrantsToken", "fetchPodcastInfo", "downloadPodcast", "CartNetworkManager", "finalCartSubmitOrder", "finalCartSubmitQuote", "updateCartHeaderDetails", "fetchCustomCartFieldsValues", "updateCartCustomFieldsValues", "fetchCustomCartFields", "getCartTotals", "updateCartItem", "removeItemFromCart", "removeUserCart", "fetchCartItems", "fetchActiveCartId", "fetchNewCart", "fetchCartHeaderDetails", "fetchCartTotalWithPricing", "insertMultipleItemsToCart", "updateCartShipAndLocation", "fetchPendingCarts", "rejectPending", "SearchNetworkManager", "fetchSearchResults", "ItemNetworkManager", "fetchItemFeatures", "fetchItemSpecifications", "fetchItemVideos", "fetchItemDocuments", "fetchItemAccessories", "fetchItemGoTogethers", "fetchItemsPricing", "RecFreqNetworkManager", "fetchRecentItems", "fetchFrequentItems", "QuickOrderNetworkManager", "fetchQuickOrderTypeAhead", "CatalogNetworkManager", "sendMailMeCatalogsRequest", "fetchCatalogsData", "fetchRequestCatalogsData", "BrandNetworkManager", "getShopByBrands", "getFeaturedBrands", "getBrandCategoryItemsBestSellers", "getAllBrandCategories", "getBrandItems", "MyAccountNetworkManager", "getBranchInfoByCustomer", "changePassword", "updateShopperInfo", "updateCustomerShopperInfo", "getContacts", "updateContact", "createContact", "deleteContact", "getShoppersByCustomerID", "getShoppersManagers", "getShopperForEdit", "getShopperForEditRole", "updateApproverIdForShoppers", "getShopperDefaults", "updateShopperDefaults", "getCustomFields", "insertCustomField", "updateCustomfield", "deleteCustomfield", "searchInvoices", "downloadPdf", "reOrderInvoices", "fetchTypeAhead", "getInvoiceAging", "searchOrders", "getOrderItemDetails", "getOrderHeaderDetails", "reOrderOrder", "getBillTrustInfo", "getItemsFromQuote", "uploadCheck", "shoppingListItemsInsert", "fetchAdvertisingDollarsForCustomer", "fetchIncentiveDollarsDetails", "fetchAdvertisingProgramsInfo", "SlakeyLoyaltyProgramNetworkManager", "fetchSlakeyLoyaltyPointsForCustomer", "WarrantyNetworkManager", "getWarrantyVendorInfo", "generateWarrantyExcel", "getWarrantyProductGroup", "getWarrantyItemsAvailable", "getWarrantyHistorySearch", "getWarrantyHistorySearchMoreInfo", "getWarrantyClaimDetailLine", "getWarrantyClaimDetailHdr", "getWarrantyClaimStatusCode", "getWarrantyFailCodes", "getWarrantyEquipment", "getWarrantyEquipmentMonths", "getWarrantyClaimDetailAdditional", "getWarrantyAdditionalFields", "getWarrantyItemsFromInvoice", "getWarrantyItemInfo", "getWarrantyLeak", "getWarrantyProductType", "getWarrantyReturnInstructions", "getWarrantySerialValidation", "postWarrantyPartInsert", "postWarrantyClaim", "postWarrantyDetailAdditional", "postWarrantyUpdateNotes", "BloomreachNetworkManager", "search", "getAllSearchResults", "autoSuggestSearch", "getAllCategories", "getPricingFromBloomreachReturn"]

let nameArray = ["Bob", "Sally", "Bob", "Sam", "Michael"]
func mostCommonNameInArray(array: [String]) -> String {
    var nameCountDictionary = [String: Int]()
    for name in array {
        if let count = nameCountDictionary[name] {
            nameCountDictionary[name] = count + 1
        } else {
            nameCountDictionary[name] = 1
        }
    }
    
    var mostCommonName = ""
    for key in nameCountDictionary.keys {
        if mostCommonName == "" {
            mostCommonName = key
        } else {
            let count = nameCountDictionary[key]
            if count! > nameCountDictionary[mostCommonName]! {
                mostCommonName = key
            }
        }
        print("\(key): \(nameCountDictionary[key]!)")
    }
    return mostCommonName
}

print(mostCommonNameInArray(array: networkManagerArray))

import UIKit

var arr = [9, 14, 22, 22, 22, 8, 0, -4, 29]
//
func findMostCommon(array: [Int]) -> Int {
    var currentHighestElement = 0
    var tempCounter = 0
    var highScore = 0

    for index in array {
        for item in array {
            if item == index  {
                tempCounter += 1

                if tempCounter > highScore {
                    currentHighestElement = index
                    highScore = tempCounter
                }
            }
        }
        tempCounter = 0
    }
    return currentHighestElement
}

findMostCommon(array: arr)
