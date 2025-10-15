# ARGProductsFlow_EC

## Overview
This is a Dynamics 365 Finance and Operations (X++) customization project for Vitro ARG, implementing custom products flow functionality for e-commerce integration.

## Project Information
- **Model**: Vitro ARG
- **Project Type**: Dynamics AX/D365 Finance and Operations Extension
- **Target Framework**: .NET Framework 4.6
- **Platform**: Dynamics 365 Finance and Operations

## Components

### Classes
- **CustomProductsFlowARG_Contract**: Data contract class for products flow operations
- **CustomProductsFlowARG_Controller**: Controller class managing the products flow business logic
- **CustomProductsFlowARG_Service**: Service class providing products flow functionality

### Menu Items
- **CustomProductsFlowARGAction**: Action menu item for triggering products flow operations

### Labels
- **CustomProductsFlowARGLabel_en-US**: English (US) label file
- **CustomProductsFlowARGLabel_es-MX**: Spanish (Mexico) label file

## Build Configuration
- **Configuration**: Debug
- **Platform**: AnyCPU
- **DB Sync in Build**: Enabled
- **Generate Cross References**: Enabled

## Requirements
- Microsoft Dynamics 365 Finance and Operations development environment
- Visual Studio with Dynamics 365 Finance and Operations extension
- MSBuild tools for Dynamics AX/D365

## Build Instructions
1. Open `ARGProductsFlow_EC.sln` in Visual Studio
2. Ensure you have the Dynamics 365 Finance and Operations development tools installed
3. Build the solution using the Debug configuration
4. The build output will be generated in the `bin` directory

## Development
This project follows the standard Dynamics 365 Finance and Operations development patterns:
- Classes are organized under the `Classes` folder
- Menu items are organized under the `Action Menu Items` folder
- Labels support both English (US) and Spanish (Mexico) locales

## License
Proprietary - Vitro ARG
