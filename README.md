# **Example Voting App**

A simple distributed application running across multiple Azure containers within VNet using Terraform.


## **Prerequisites**
- Azure CLI  
- Terraform  


## **Application Overview**
This project sets up a three-tier application on Azure using Container Apps.  

- **Frontend:** A web interface accessible to users.  
- **Backend:** Handles all application logic and connects to the database.  
- **Database:** Stores application data securely.  

All components communicate securely within a Virtual Network (VNet). The deployment is automated using Terraform for easy and repeatable setups.  

## **To Test Deployment Locally**

### **1. Clone the Repository**

```bash
git clone https://github.com/nithishvjs/PROJECT-Three-tier-on-ACA.git
cd Application
```

### **2. Deploy the Container**

```bash
docker compose up
```

### **3. Access the Application**

```bash
Vote will run on http://localhost:8080
Result will run on http://localhost:8081
```


### **4. Destroy the Container**

```bash
docker compose down
```

## **Application Setup**

### **Clone the Repository**

```bash
git clone https://github.com/nithishvjs/PROJECT-Three-tier-on-ACA.git
```

### **Initialize Terraform**

```bash
terraform init
```

### **Plan the Deployment**

```bash
terraform plan
```

###  **Apply the Configuration**

```bash
terraform apply --auto-approve
```

### **After created the deployement, Destroy the containers**

```bash
terraform destroy --auto-approve
```

**Why choose ACA instead of AKS?**

Read this: https://www.linkedin.com/posts/nithishakash_7-key-differences-between-azure-kubernetes-activity-7352710148005548032-unHY?utm_source=share&utm_medium=member_android&rcm=ACoAAEel6dIB9wkGmzrh38APELpNoDFloUGPqvc
