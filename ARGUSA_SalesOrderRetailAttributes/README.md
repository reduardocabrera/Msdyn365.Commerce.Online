# ARGUSA_SalesOrderRetailAttributes

A Microsoft Dynamics 365 Finance and Operations customization project for Vitro Argentina (ARG) focused on extending sales order functionality with retail attributes integration.

## Overview

This project extends the standard Dynamics 365 F&O sales order module to incorporate retail transaction attributes, enabling better visibility and tracking of retail-originated sales orders.

## Project Details

- **Model**: Vitro ARG
- **Target Framework**: .NET Framework 4.6
- **Project Type**: Dynamics AX (rnrproj)
- **Platform**: Microsoft Dynamics 365 Finance and Operations

## Components

### Class Extensions

- **SalesTable_Extension**: Extends the SalesTable class with additional functionality for retail attributes

### Form Extensions

- **SalesTableListPage.VitroARG**: Customization of the Sales Order List Page to display retail attributes

### Query Extensions

- **SalesTableListPage.VitroARG**: Simple query extension for the Sales Order List Page

### Views

The project includes multiple views to display retail transaction attributes:

- **VitroARG_FieldsSalesTableLPView**: Fields view for Sales Table List Page
- **VitroARG_RTATARGOrdSView**: ARG Order Status retail attributes
- **VitroARG_RTATOnTimeIdView**: On-Time ID retail attributes
- **VitroARG_RTATOnTimeTNView**: On-Time Transaction Number retail attributes
- **VitroARG_RTATPONumberView**: Purchase Order Number retail attributes
- **VitroARG_RTATSAPDelIdView**: SAP Delivery ID retail attributes
- **VitroARG_RTATSAPOrdNView**: SAP Order Number retail attributes
- **VitroARG_RTATTransactionIdView**: Transaction ID retail attributes
- **VitroARG_SalesTableView**: Main Sales Table view with retail attributes

## Build Configuration

The project is configured for Debug mode with the following settings:

- **DB Sync in Build**: Enabled
- **Generate Cross References**: Enabled
- **Startup Object**: SalesTableListPage (SalesTableListPage.VitroARG)

## Purpose

This customization enables Vitro Argentina to:

- Track retail transaction attributes on sales orders
- Link retail transactions with SAP order information
- Monitor delivery and timing metrics
- Enhance visibility of retail-originated orders in the sales order list page

## Development

This project uses the standard Dynamics 365 F&O development tools and requires Visual Studio with Dynamics 365 development tools installed.

### Requirements

- Visual Studio 2017 or later
- Microsoft Dynamics 365 Finance and Operations development environment
- Dynamics AX Build Tasks (MSBuild tools)

## License

Internal Vitro Argentina project
