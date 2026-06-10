# Pet Boarding Management Database System

## Overview

This project is a relational database system designed for a professional pet boarding and training center.

The system supports customer management, pet records, vaccination tracking, service reservations, cage allocation, employee scheduling, payment processing, and operational reporting.

Beyond transaction management, the project also includes analytical SQL queries that generate business insights for resource planning and service optimization.

---

## Business Scenario

The pet care center provides:

- Pet boarding services
- Professional training programs
- Vaccination verification
- Cage allocation management
- Payment processing

The system is designed to ensure efficient resource allocation while preventing scheduling conflicts and operational bottlenecks.

---

## Key Features

### Customer Management

- Customer registration
- Contact information maintenance
- Customer history tracking

### Pet Management

- Pet profiles
- Breed and age records
- Vaccination tracking

### Booking Management

- Boarding reservations
- Training reservations
- Conflict detection

### Resource Allocation

- Cage assignment
- Trainer assignment
- Capacity monitoring

### Payment Management

- Boarding fee calculation
- Training fee calculation
- Payment status tracking

### Business Reporting

- Cage utilization analysis
- Service popularity analysis
- Training effectiveness evaluation

---

## Database Design

The database follows a normalized relational structure.

Core entities include:

```text
Pet Owner
    ↓
Pet
    ↓
Booking
    ↓
Service
    ↓
Payment

Employee
Cage
Training Progress
Vaccination Record
