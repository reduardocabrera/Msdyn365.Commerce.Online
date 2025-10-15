# Vitro ARG Commerce Model Documentation

## Overview

This document provides a comprehensive overview of the Vitro Automotive ARG (Glass) Dynamics 365 Commerce customization model. The solution extends D365 Finance & Operations with specialized functionality for automotive glass commerce, retail channel integration, and external system connectivity.

## Model Information

- **Model Name**: Vitro ARG
- **Model ID**: 896000583
- **Version**: 1.0.0.0
- **Publisher**: Vitro
- **Layer**: 12 (ISV Layer)
- **Platform**: Dynamics 365 Finance & Operations with Commerce
- **Framework**: .NET Framework 4.6

## Model Statistics

- **Classes**: 45
- **Tables**: 6 (+ 5 Extensions)
- **Forms**: 2 (+ 4 Extensions)
- **Views**: 11 (+ 2 Extensions)
- **Data Entities**: 2 (+ 4 Extensions)
- **Services**: 5
- **Security Roles**: 2
- **Security Duties**: 3
- **Security Privileges**: 8
- **Label Files**: 15 (Supporting en-US and es-MX)

## Module Dependencies

- ApplicationSuite (Core ERP)
- Retail (Commerce/POS)
- GeneralLedger, Ledger, Subledger
- Dimensions, FinTag
- Tax
- Directory, ContactPerson
- Personnel modules (HRPlatform, PersonnelCore, etc.)
- FiscalBooks
- Currency, UnitOfMeasure

## Functional Modules

### 1. Sales Order Management

#### Core Components
- **ARGSalesTable**: Extended sales table with e-commerce and integration fields
- **ARGSalesTableStaging**: DMF staging for sales data import/export
- **SalesTable_Extension**: Comprehensive extension adding retail transaction attributes

#### Integration Fields
- Transaction ID (E-commerce)
- OnTime System (ID and Tracking Number)
- SAP Integration (Delivery ID, Order Number)
- Paytrace Payment Gateway (ID, Approval Code)
- Shipping Information (Cost, Address, Delivery Mode)

#### Key Classes
- `ARGSalesOrderInvoiceCreateService`: Complete order-to-invoice workflow
- `SalesOrderTableEventHandler`: Synchronizes standard and custom sales tables
- `ARGSalesOrderSAPFieldsService`: SAP field updates (partial implementation)

### 2. Retail Channel Integration

#### Retail Transaction Attributes (RTAT)
Multiple views for retail transaction tracking:
- `VitroARG_RTATTransactionIdView`: Transaction ID tracking
- `VitroARG_RTATOnTimeIdView`: OnTime system integration
- `VitroARG_RTATSAPOrdNView`: SAP order number mapping
- `VitroARG_RTATSAPDelIdView`: SAP delivery ID tracking
- `VitroARG_RTATPONumberView`: Purchase order tracking
- `VitroARG_RTATARGOrdSView`: ARG order status

#### Retail Parameters Extension
- `RetailParameters.VitroARG`: Email configuration for retail notifications

### 3. Customer Management

#### Extensions
- `CustTable.VitroARG`: Credit management fields (limit, balance, available)
- `LogisticsPostalAddress.VitroARG`: Additional contact fields (phone, mobile, fax)

#### Forms
- `VitroARG_CustomersForm`: Enhanced customer management UI
- `CustTable.VitroARG` (Form Extension): UI modifications for credit fields
- `CustParameters.VitroARG` (Form Extension): Customer parameter enhancements

### 4. Postal Code & Delivery Management

#### Tables
- `ARGPostalCodes`: Master data for postal codes and delivery routes
- `ARGPostalCodesStaging`: Import/export staging

#### Services
- `ARGPostalCodeService`: Lookup and management services
- `JobPostalCodes`: Excel import utility using EPPlus

#### Data Structure
- Route identification
- Company assignment
- Delivery hour scheduling
- City/State/PostalCode mapping

### 5. Inventory Management

#### Inventory Adjustment Module
- `ARGInvAdjPostService`: Posting inventory adjustments
- `ARGInvAdjPostClass`: Data contract for adjustments
- Transaction handling with error logging

### 6. Sales Agreements & Pricing

#### Components
- `ARGSalesAgreeJourPostService`: Posts trade agreements
- `ARGSalesAgreeJourUpdateService`: Updates agreements by customer/group
- Date-based agreement expiration logic
- Batch processing capabilities

### 7. Reporting & Analytics

#### Sales Reporting
- `ARGSalesOrderReport` (Form): Custom sales order reporting
- `ARGSalesReportFields`: Configuration for report fields
- `VitroARG_SalesTableView`: Comprehensive sales data view

#### Customer Reporting
- `VitroARG_CustomerView`: Enhanced customer data view
- `ARGCustomerReportLabels`: Localized report labels

### 8. System Integration Framework

#### Service-Oriented Architecture
All services follow consistent patterns:
- Request/Response classes with DataContract attributes
- Service classes with business logic
- Error handling and logging to `ARGCustomBatchJobLog`

#### Integration Services
1. **Inventory Adjustment**: `ARGInvAdjPostService`
2. **Postal Codes**: `ARGPostalCodeService`
3. **Sales Agreements**: `ARGSalesAgreeJourPostService`, `ARGSalesAgreeJourUpdateService`
4. **Sales Orders**: `ARGSalesOrderInvoiceCreateService`

#### Service Groups
Each service has a corresponding service group for WCF/SOAP exposure:
- `ARGInvAdjPostServiceGroup`
- `ARGPostalCodeServiceGroup`
- `ARGSalesAgreeJourPostServiceGroup`
- `ARGSalesAgreeJourUpdateServiceGroup`
- `ARGSalesOrderInvoiceCreateServiceGroup`

### 9. Security Model

#### Roles
- **ARG_CSRRole**: Customer Service Representative role
- **ARG_Warehouseman**: Warehouse operations role

#### Duties
- **ARG_CSRDuty**: CSR responsibilities
- **ARG_CustCustomerMaintain**: Customer maintenance
- **ARG_ReturnSalesReturnOrderMaintain**: Return order processing

#### Privileges
- **ARG_CSRPrivilegeMaintain**: Full CSR access
- **ARG_CSRPrivilegeView**: Read-only CSR access
- **ARG_CustCustomization**: Customer customization rights
- **ARG_SalesCustomization**: Sales customization rights
- Entity privileges for postal codes and sales tables (Maintain/View)

### 10. Data Management Framework (DMF)

#### Data Entities
- **ARGSalesTableEntity**: Sales data import/export
- **ARGPostalCodesEntity**: Postal code management

#### Staging Tables
All staging tables follow DMF patterns with:
- DefinitionGroup and ExecutionId fields
- TransferStatus tracking
- IsSelected flag for processing

### 11. Batch Processing & Jobs

#### Utility Jobs
- `ARGFullFillSalesTableReportJob`: Migrates SalesTable to ARGSalesTable
- `ARGSalesAgreeJourUpdateJob`: Complex sales order workflow processing
- `ARGSalesOrderInvoiceCreationJob`: Standalone invoice creation
- `ARGTestProratedJob`: Tests prorated retail charges
- `JobPostalCodes`: Excel import for postal codes

#### Batch Framework
- `ARGSalesAgreeJourPosting`: RunBaseBatch implementation
- Transaction handling with ttsbegin/ttscommit
- Bulk operations using RecordInsertList

### 12. SysOperation Framework Implementation

#### Custom Products Flow
- `CustomProductsFlowARG_Controller`: SysOperation controller
- `CustomProductsFlowARG_Service`: Service implementation
- `CustomProductsFlowARG_Contract`: Parameter contract
- Menu item: `CustomProductsFlowARGAction`

#### Tutorial Framework (Template)
- `dfTutSysOperationsController`
- `dfTutSysOperationsService`
- `dfTutSysOperationsContract`

### 13. Utilities

#### Password Reset
- `ResetPasswordARG`: Email-based password reset
- Integration with email templates
- Customer validation logic

#### Logging
- `ARGCustomBatchJobLog`: Centralized logging for batch operations
- Fields for message, journal, description, user, timestamp

## Localization

### Supported Languages
- **en-US**: English (United States)
- **es-MX**: Spanish (Mexico)

### Label Files
- ARG_NewSalesOrderLabel
- ARG_Roles
- ARG_ShippingCostDisplay_EC
- ARGCustomerPostalAddress
- ARGCustomerReportLabels
- ARGResetPassword
- CustomProductsFlowARGLabel

## Architecture Patterns

### 1. Extension Model
- Minimal customization to standard objects
- Form/Table/View extensions preserve upgrade paths
- Event handlers for business logic injection

### 2. Service-Oriented Architecture
- Consistent Request/Response pattern
- DataContract serialization
- Service groups for SOAP/WCF exposure

### 3. Event-Driven Design
- PostHandlerFor table events
- FormDataSourceEventHandler for UI events
- Loose coupling between modules

### 4. Integration Patterns
- Staging tables for ETL operations
- External system field mapping (SAP, OnTime, Paytrace)
- Retail channel attribute synchronization

### 5. Error Handling
- Centralized logging table
- CLR exception management
- InfoLog capture and processing

## Development Status

### Complete Implementations
- Sales order retail attributes
- Postal code management
- Customer credit extensions
- Inventory adjustment posting
- Basic reporting structure

### Partial Implementations
- SAP field synchronization (methods exist but incomplete)
- Some batch jobs contain commented code
- Event handlers partially commented

### Placeholder/Template Code
- Tutorial SysOperation framework classes
- Some service methods return placeholder values

## Key Integration Points

1. **E-Commerce Platform**: Transaction IDs, shopping cart data
2. **SAP ERP**: Order numbers, delivery IDs
3. **OnTime System**: Tracking numbers, system IDs
4. **Paytrace Gateway**: Payment processing, approval codes
5. **Retail Channels**: Store-based transactions, POS integration
6. **Excel Import/Export**: Postal codes, bulk data operations

## Deployment Considerations

- Model requires ISV layer deployment
- Database synchronization required for new tables
- Cross-reference generation enabled by default
- Debug configuration for development environments
- Company-specific data for most custom tables

## Menu Structure

### Action Menu Items
- `CustomProductsFlowARGAction`: Products flow processing
- `ResetPasswordARG`: Password reset utility

### Display Menu Items
- `ARGPostalCodesMenuItem`: Postal code management
- `ARGSalesOrderReport`: Sales reporting
- `VitroARG_CustomersForm`: Customer management

## Future Extensibility

The model structure supports:
- Additional external system integrations
- Enhanced retail channel features
- Extended reporting capabilities
- Additional language support
- More sophisticated pricing rules
- Advanced inventory management features

## Technical Notes

- All custom objects use "ARG" or "VitroARG" prefix
- XML-based metadata storage
- Standard D365 F&O development patterns
- Visual Studio project structure (.rnrproj files)
- Supports standard ALM processes