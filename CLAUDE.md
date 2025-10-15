# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Microsoft Dynamics 365 Finance and Operations customization project for Vitro Automotive Glass (Vitro Automotive ARG). The project consists of multiple modules implementing commerce, sales, reporting, and integration functionality. The solution uses Dynamics 365 Commerce extensively, so you will see many references to Retail Channels and Stores throughout the codebase.

## Technology Stack

- **Platform**: Microsoft Dynamics 365 Finance and Operations (D365 F&O) with Commerce
- **Language**: X++ (Dynamics AX programming language)
- **Framework**: .NET Framework 4.6
- **Model**: Vitro ARG (Model ID: 896000583)
- **Development Tools**: Visual Studio with Dynamics 365 Finance and Operations extension

## Project Structure

The repository contains multiple solution projects, each focused on specific functionality:

- **ARGProductsFlow_EC**: E-commerce products flow integration using SysOperation Framework
- **ARGUSA_SalesOrderRetailAttributes**: Retail transaction attributes for sales orders
- **ARGUSASalesOrderInvoice**: Sales order invoice customizations
- **ARGSalesTableDisplay_EC**: Sales table display enhancements
- **ARGCustomerReport_EC**: Customer reporting functionality
- **ARG_NewSalesOrderReport_EC**: New sales order reporting
- **ARGSalesTradeAgreements v1.3**: Trade agreements customization
- **ResetPasswordARG_EC**: Password reset functionality
- **ARG_SysOperationFramework_EC**: System operation framework extensions
- **ARGVertexCustomized**: Vertex tax integration customizations
- **ARGInventoryAdjustment**: Inventory adjustment customizations
- **ARG_Roles_EC**: Security role customizations
- **Metadata/VitroARG**: Compiled model metadata containing all customization artifacts

## Build Commands

Each project can be built individually using Visual Studio:

```bash
# Open a specific solution in Visual Studio
# Example: ARGProductsFlow_EC/ARGProductsFlow_EC.sln

# Build using MSBuild (requires Dynamics AX Build Tasks)
msbuild [ProjectName].rnrproj /p:Configuration=Debug /p:Platform=AnyCPU
```

## Build Configuration

All projects share common build settings:
- **Configuration**: Debug
- **Platform**: AnyCPU
- **DB Sync in Build**: Enabled (synchronizes database during build)
- **Generate Cross References**: Enabled

## Key Architectural Components

### SysOperation Framework Pattern
Multiple projects (ARGProductsFlow_EC, ARG_SysOperationFramework_EC) use the D365 SysOperation Framework pattern with:
- **Contract classes**: Data containers for operation parameters
- **Controller classes**: Business logic orchestration
- **Service classes**: Service layer implementation

### Extension Model
Projects use the extension model to customize standard D365 objects:
- **Form Extensions**: Extending standard forms (e.g., SalesTableListPage.VitroARG)
- **Class Extensions**: Extending standard classes (e.g., SalesTable_Extension)
- **Query Extensions**: Extending standard queries

### Integration Points
- **SAP Integration**: Views and fields for SAP order/delivery tracking (RTATSAPOrdNView, RTATSAPDelIdView)
- **Retail/Commerce Integration**: Retail transaction attribute tracking, integration with Retail Channels and Stores
- **Vertex Tax Integration**: Tax calculation customizations

### Data Entities
- **ARGSalesTableEntity**: Sales table data entity for import/export
- **ARGPostalCodesEntity**: Postal codes management

## Module Dependencies

The Vitro ARG model depends on these D365 modules:
- ApplicationSuite (core ERP functionality)
- Retail (retail/POS functionality)
- GeneralLedger, Ledger, Subledger (financial modules)
- Dimensions, FinTag (financial dimensions)
- Tax (tax engine)
- Personnel modules (HR functionality)

## Localization

Projects support multi-language with label files for:
- **en-US**: English (United States)
- **es-MX**: Spanish (Mexico)

Label files are located in each project's Label Files folder and in Metadata/VitroARG/Vitro ARG/AxLabelFile/LabelResources/

## Development Notes

- All X++ classes, forms, tables, and other artifacts are stored as XML metadata files
- The compiled model is in the Metadata/VitroARG folder
- Projects use the .rnrproj format (Dynamics AX project format)
- Each project can have its own startup object for debugging (configured in .rnrproj file)