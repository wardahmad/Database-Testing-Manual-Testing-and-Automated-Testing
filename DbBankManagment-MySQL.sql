create database dbBankManagement;
use dbBankManagement;

-- CREATING TABLES
CREATE TABLE UserLogins
(
	UserLoginID SMALLINT NOT NULL AUTO_INCREMENT,
	UserLogin VARCHAR(50) NOT NULL,
	UserPassword VARCHAR(20) NOT NULL,
	CONSTRAINT pk_UL_UserLoginID PRIMARY KEY(UserLoginID)
);


CREATE TABLE UserSecurityQuestions
(
	UserSecurityQuestionID TINYINT NOT NULL AUTO_INCREMENT,
	UserSecurityQuestion VARCHAR(50) NOT NULL,
	CONSTRAINT pk_USQ_UserSecurityQuestionID PRIMARY KEY(UserSecurityQuestionID)
);


CREATE TABLE AccountType
(
	AccountTypeID TINYINT NOT NULL AUTO_INCREMENT,
	AccountTypeDescription VARCHAR(30) NOT NULL,
	CONSTRAINT pk_AT_AccountTypeID PRIMARY KEY(AccountTypeID)
);


CREATE TABLE SavingsInterestRates
(
	InterestSavingRatesID TINYINT NOT NULL AUTO_INCREMENT,
	InterestRatesValue FLOAT NOT NULL, 
	InterestRatesDescription VARCHAR(20) NOT NULL,
	CONSTRAINT pk_SIR_InterestSavingRatesID PRIMARY KEY(InterestSavingRatesID)
);


CREATE TABLE AccountStatusType
(
	AccountStatusTypeID TINYINT NOT NULL AUTO_INCREMENT,
	AccountStatusTypeDescription VARCHAR(30) NOT NULL,
	CONSTRAINT pk_AST_AccountStatusTypeID PRIMARY KEY(AccountStatusTypeID)
);


CREATE TABLE FailedTransactionErrorType
(
	FailedTransactionErrorTypeID TINYINT NOT NULL AUTO_INCREMENT,
	FailedTransactionErrorTypeDescription VARCHAR(50) NOT NULL,
	CONSTRAINT pk_FTET_FailedTransactionErrorTypeID PRIMARY KEY(FailedTransactionErrorTypeID)
);


CREATE TABLE LoginErrorLog
(
	ErrorLogID INT NOT NULL AUTO_INCREMENT,
	ErrorTime DATETIME NOT NULL,
	FailedTransactionXML LONGTEXT,
	CONSTRAINT pk_LEL_ErrorLogID PRIMARY KEY(ErrorLogID)
);


CREATE TABLE Employee
(
	EmployeeID INT NOT NULL AUTO_INCREMENT,
	EmployeeFirstName VARCHAR(25) NOT NULL,
	EmployeeMiddleInitial CHAR(1),
	EmployeeLastName VARCHAR(25),
	EmployeeisManager int,
	CONSTRAINT pk_E_EmployeeID PRIMARY KEY(EmployeeID)
);


CREATE TABLE TransactionType
(
	TransactionTypeID TINYINT NOT NULL AUTO_INCREMENT,
	TransactionTypeName CHAR(10) NOT NULL,
	TransactionTypeDescription VARCHAR(50),
	TransactionFeeAmount decimal(15,2),
	CONSTRAINT pk_TT_TransactionTypeID PRIMARY KEY(TransactionTypeID)
);


CREATE TABLE FailedTransactionLog
(
	FailedTransactionID INT NOT NULL AUTO_INCREMENT,
	FailedTransactionErrorTypeID TINYINT NOT NULL,
	FailedTransactionErrorTime DATETIME,
	FailedTransactionErrorXML LONGTEXT,
	CONSTRAINT pk_FTL_FailedTransactionID PRIMARY KEY(FailedTransactionID),
	CONSTRAINT fk_FTET_FailedTransactionErrorTypeID FOREIGN KEY(FailedTransactionErrorTypeID) REFERENCES FailedTransactionErrorType(FailedTransactionErrorTypeID) 
);


CREATE TABLE UserSecurityAnswers
(
	UserLoginID SMALLINT NOT NULL AUTO_INCREMENT,
	UserSecurityAnswers VARCHAR(25) NOT NULL,
	UserSecurityQuestionID TINYINT NOT NULL,
	CONSTRAINT pk_USA_UserLoginID PRIMARY KEY(UserLoginID), 
	CONSTRAINT fk_UL_UserLoginID FOREIGN KEY(UserLoginID) REFERENCES UserLogins(UserLoginID),
	CONSTRAINT fk_USQ_UserSecurityQuestionID FOREIGN KEY(UserSecurityQuestionID) REFERENCES UserSecurityQuestions(UserSecurityQuestionID)
);


CREATE TABLE Account
(
	AccountID INT NOT NULL AUTO_INCREMENT,
	CurrentBalance INT NOT NULL,
	AccountTypeID TINYINT NOT NULL REFERENCES AccountType (AccountTypeID),
	AccountStatusTypeID TINYINT NOT NULL,
	InterestSavingRatesID TINYINT NOT NULL,
	CONSTRAINT pk_A_AccounID PRIMARY KEY(AccountID),
	CONSTRAINT fk_AST_AccountStatusTypeID FOREIGN KEY(AccountStatusTypeID) REFERENCES AccountStatusType(AccountStatusTypeID),
	CONSTRAINT fk_SIR_InterestSavingRatesID FOREIGN KEY(InterestSavingRatesID) REFERENCES SavingsInterestRates(InterestSavingRatesID)
);


CREATE TABLE LoginAccount
(
	UserLoginID SMALLINT NOT NULL,
	AccountID INT NOT NULL,
	CONSTRAINT fk_UL_UserLogins FOREIGN KEY(UserLoginID) REFERENCES UserLogins(UserLoginID),
	CONSTRAINT fk_A_Account FOREIGN KEY(AccountID) REFERENCES Account(AccountID)
);


CREATE TABLE Customer
(
	CustomerID INT NOT NULL AUTO_INCREMENT,
	AccountID INT NOT NULL,
	CustomerAddress1 VARCHAR(30) NOT NULL,
	CustomerAddress2  VARCHAR(30),
	CustomerFirstName  VARCHAR(30) NOT NULL,
	CustomerMiddleInitial CHAR(1),
	CustomerLastName  VARCHAR(30) NOT NULL,
	City  VARCHAR(20) NOT NULL,
	State CHAR(2) NOT NULL,
	ZipCode CHAR(10) NOT NULL,
	EmailAddress CHAR(40) NOT NULL,
	HomePhone VARCHAR(10) NOT NULL,
	CellPhone VARCHAR(10) NOT NULL,
	WorkPhone VARCHAR(10) NOT NULL,
	SSN VARCHAR(9),
	UserLoginID SMALLINT NOT NULL,
	CONSTRAINT pk_C_CustomerID PRIMARY KEY(CustomerID),
	CONSTRAINT fk_A_AccountID FOREIGN KEY(AccountID) REFERENCES Account(AccountID),
	CONSTRAINT fk_UL_C_UserLoginID FOREIGN KEY(UserLoginID) REFERENCES UserLogins(UserLoginID)  
);


CREATE TABLE CustomerAccount
(
	AccountID INT NOT NULL ,
	CustomerID INT NOT NULL,
	CONSTRAINT fk_A_CA_AccountID FOREIGN KEY(AccountID) REFERENCES Account(AccountID),
	CONSTRAINT fk_C_CA_CustomerID FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID)
);


CREATE TABLE TransactionLog
(
	TransactionID INT NOT NULL AUTO_INCREMENT,
	TransactionDate DATETIME NOT NULL,
	TransactionTypeID TINYINT NOT NULL,
	TransactionAmount decimal(15,2) NOT NULL,
	NewBalance decimal(15,2) NOT NULL,
	AccountID INT NOT NULL,
	CustomerID INT NOT NULL,
	EmployeeID INT NOT NULL,
	UserLoginID SMALLINT NOT NULL,
	CONSTRAINT pk_TL_TransactionID PRIMARY KEY(TransactionID),
	CONSTRAINT fk_TT_TL_TransactionTypeID FOREIGN KEY(TransactionTypeID) REFERENCES TransactionType(TransactionTypeID),
	CONSTRAINT fk_A_TL_AccountID FOREIGN KEY(AccountID) REFERENCES Account(AccountID),
	CONSTRAINT fk_C_TL_CustomerID FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID),
	CONSTRAINT fk_E_TL_EmployeeID FOREIGN KEY(EmployeeID) REFERENCES Employee(EmployeeID),
	CONSTRAINT fk_UL_TL_UserLoginID FOREIGN KEY(UserLoginID) REFERENCES UserLogins(UserLoginID)    
);


CREATE TABLE OverDraftLog
(
	AccountID INT NOT NULL AUTO_INCREMENT,
	OverDraftDate DATETIME NOT NULL,
	OverDraftAmount decimal(15,2) NOT NULL,
	OverDraftTransactionXML LONGTEXT NOT NULL,
	CONSTRAINT Pk_ODL_AccountID PRIMARY KEY(AccountID),
	CONSTRAINT fk_A_ODL_AccountID FOREIGN KEY(AccountID) REFERENCES Account(AccountID)
);

-- INSERT INTO TABLES
insert into UserLogins (UserLogin,UserPassword) values('User1', 'Pass1');
insert into UserLogins (UserLogin,UserPassword) values('User2', 'Pass2');
insert into UserLogins (UserLogin,UserPassword) values('User3', 'Pass3');
insert into UserLogins (UserLogin,UserPassword) values('User4', 'Pass4');
insert into UserLogins (UserLogin,UserPassword) values('User5', 'Pass5');


insert into UserSecurityQuestions (UserSecurityQuestion) values('What is your favourite food?');
insert into UserSecurityQuestions (UserSecurityQuestion) values('What is your favourite food?');
insert into UserSecurityQuestions (UserSecurityQuestion) values('What is your favourite food?');
insert into UserSecurityQuestions (UserSecurityQuestion) values('What is your favourite food?');
insert into UserSecurityQuestions (UserSecurityQuestion) values('What is your favourite food?');


Insert into AccountType (AccountTypeDescription) values('Savings');
Insert into AccountType (AccountTypeDescription) values('Checking');


insert into SavingsInterestRates (InterestRatesValue, InterestRatesDescription) values(0.5, 'Low');
insert into SavingsInterestRates (InterestRatesValue, InterestRatesDescription) values(2, 'Medium');
insert into SavingsInterestRates (InterestRatesValue, InterestRatesDescription) values(3, 'High');
insert into SavingsInterestRates (InterestRatesValue, InterestRatesDescription) values(4, 'Very high');
insert into SavingsInterestRates (InterestRatesValue, InterestRatesDescription) values(5, 'Super high');


insert into AccountStatusType (AccountStatusTypeDescription) values('Closed');
insert into AccountStatusType (AccountStatusTypeDescription) values('Active');
insert into AccountStatusType (AccountStatusTypeDescription) values('Dormant');
insert into AccountStatusType (AccountStatusTypeDescription) values('Passive');
insert into AccountStatusType (AccountStatusTypeDescription) values('Active');


insert into FailedTransactionErrorType (FailedTransactionErrorTypeDescription) values('Withdraw limit reached');
insert into FailedTransactionErrorType (FailedTransactionErrorTypeDescription) values('Daily limit reached');
insert into FailedTransactionErrorType (FailedTransactionErrorTypeDescription) values('No tenough balance');
insert into FailedTransactionErrorType (FailedTransactionErrorTypeDescription) values('Invalid denomination');
insert into FailedTransactionErrorType (FailedTransactionErrorTypeDescription) values('ATM machine down');


insert into LoginErrorLog (ErrorTime, FailedTransactionXML) values('2015/6/4 07:30:56', 'Bad Connection');
insert into LoginErrorLog (ErrorTime, FailedTransactionXML) values('2018/6/9 12:34:57', 'Invalid User');
insert into LoginErrorLog (ErrorTime, FailedTransactionXML) values('2016/4/5 02:14:00', 'Wrong Password');
insert into LoginErrorLog (ErrorTime, FailedTransactionXML) values('2014/7/5 05:56:59', 'Server issue');
insert into LoginErrorLog (ErrorTime, FailedTransactionXML) values('2009/10/12 08:34:15', 'Datacenter down');


insert into Employee (EmployeeFirstName, EmployeeMiddleInitial, EmployeeLastName, EmployeeisManager) values('E3', 'K', 'E3', 0);
insert into Employee (EmployeeFirstName, EmployeeMiddleInitial, EmployeeLastName, EmployeeisManager) values('E5', 'B', 'E5', 1);
insert into Employee (EmployeeFirstName, EmployeeMiddleInitial, EmployeeLastName, EmployeeisManager) values('E7', 'P', 'E7', 0);
insert into Employee (EmployeeFirstName, EmployeeMiddleInitial, EmployeeLastName, EmployeeisManager) values('E9', 'R', 'E9', 1);
insert into Employee (EmployeeFirstName, EmployeeMiddleInitial, EmployeeLastName, EmployeeisManager) values('E11', 'K', 'E11', '1');


insert into TransactionType (TransactionTypeName, TransactionTypeDescription, 	TransactionFeeAmount) values('Balance', 'See money', '0');
insert into TransactionType (TransactionTypeName, TransactionTypeDescription, 	TransactionFeeAmount) values('Transfer', 'Send money', '450');
insert into TransactionType (TransactionTypeName, TransactionTypeDescription, 	TransactionFeeAmount) values('Receive', 'Get money', '300');
insert into TransactionType (TransactionTypeName, TransactionTypeDescription, 	TransactionFeeAmount) values('Paid', 'Paid to John', '45000');
insert into TransactionType (TransactionTypeName, TransactionTypeDescription, 	TransactionFeeAmount) values('Statement', 'Checked monthly transaction', '0');


insert into FailedTransactionLog (FailedTransactionErrorTypeID, FailedTransactionErrorTime, FailedTransactionErrorXML) values(1, '2015/6/4 07:30:56', 'First');
insert into FailedTransactionLog (FailedTransactionErrorTypeID, FailedTransactionErrorTime, FailedTransactionErrorXML) values(2, '2018/6/9 12:34:57', 'Second');
insert into FailedTransactionLog (FailedTransactionErrorTypeID, FailedTransactionErrorTime, FailedTransactionErrorXML) values(3, '2016/4/5 02:14:00', 'Third');
insert into FailedTransactionLog (FailedTransactionErrorTypeID, FailedTransactionErrorTime, FailedTransactionErrorXML) values(4, '2014/7/5 05:56:59', 'Fourth');
insert into FailedTransactionLog (FailedTransactionErrorTypeID, FailedTransactionErrorTime, FailedTransactionErrorXML) values(5, '2009/10/12 08:34:15', 'Fifth');


insert into UserSecurityAnswers (UserSecurityAnswers, UserSecurityQuestionID) values('Apples', 1);
insert into UserSecurityAnswers (UserSecurityAnswers, UserSecurityQuestionID) values('Spiderman', 2);
insert into UserSecurityAnswers (UserSecurityAnswers, UserSecurityQuestionID) values('School1', 3);
insert into UserSecurityAnswers (UserSecurityAnswers, UserSecurityQuestionID) values('Ram', 4);
insert into UserSecurityAnswers (UserSecurityAnswers, UserSecurityQuestionID) values('Toyota', 5);


insert into Account (CurrentBalance, AccountTypeID, AccountStatusTypeID, InterestSavingRatesID) values(15000.7, 1, 1, 1);
insert into Account (CurrentBalance, AccountTypeID, AccountStatusTypeID, InterestSavingRatesID) values(25000.5, 2, 2, 2);
insert into Account (CurrentBalance, AccountTypeID, AccountStatusTypeID, InterestSavingRatesID) values(17000.2, 1, 1, 1);
insert into Account (CurrentBalance, AccountTypeID, AccountStatusTypeID, InterestSavingRatesID) values(45000, 2, 2, 2);
insert into Account (CurrentBalance, AccountTypeID, AccountStatusTypeID, InterestSavingRatesID) values(2320, 2, 2, 2);


insert into LoginAccount (UserLoginID, AccountID) values(1, 1);
insert into LoginAccount (UserLoginID, AccountID) values(2, 2);
insert into LoginAccount (UserLoginID, AccountID) values(3, 3);
insert into LoginAccount (UserLoginID, AccountID) values(4, 4);
insert into LoginAccount (UserLoginID, AccountID) values(5, 5);


insert into Customer (AccountID, CustomerAddress1, CustomerAddress2, CustomerFirstName, CustomerMiddleInitial, CustomerLastName, City, State, ZipCode, EmailAddress, HomePhone, CellPhone, WorkPhone, SSN, UserLoginID) values(1, 'Address1', 'Address2', 'Customer1', 'U', 'CLastname1', 'Ottawa', 'ON', '3A5z9z', 'user5@user.com', '141655555', '453554464', '3462325', 'A12345', 1);
insert into Customer (AccountID, CustomerAddress1, CustomerAddress2, CustomerFirstName, CustomerMiddleInitial, CustomerLastName, City, State, ZipCode, EmailAddress, HomePhone, CellPhone, WorkPhone, SSN, UserLoginID) values(2, 'Address1', 'Address2', 'Customer2', 'K', 'CLastname2', 'Hamilton', 'ON', 'fe3453', 'user6@user.com', '141655555', '567435345', '6332423', 'D34353', 2);
insert into Customer (AccountID, CustomerAddress1, CustomerAddress2, CustomerFirstName, CustomerMiddleInitial, CustomerLastName, City, State, ZipCode, EmailAddress, HomePhone, CellPhone, WorkPhone, SSN, UserLoginID) values(3, 'Address1', 'Address2', 'Customer3', 'P', 'CLastname3', 'Vacouver', 'BC', 'fdf45', 'user7@user.com', '141655555', '681316226', '9202521', 'J56361', 3);
insert into Customer (AccountID, CustomerAddress1, CustomerAddress2, CustomerFirstName, CustomerMiddleInitial, CustomerLastName, City, State, ZipCode, EmailAddress, HomePhone, CellPhone, WorkPhone, SSN, UserLoginID) values(4, 'Address1', 'Address2', 'Customer4', 'B', 'CLastname4', 'London', 'ON', '23ffbfs', 'user8@user.com', '141655555', '795197107', '8674252', 'I78369', 4);
insert into Customer (AccountID, CustomerAddress1, CustomerAddress2, CustomerFirstName, CustomerMiddleInitial, CustomerLastName, City, State, ZipCode, EmailAddress, HomePhone, CellPhone, WorkPhone, SSN, UserLoginID) values(5, 'Address1', 'Address2', 'Customer5', 'K', 'CLastname5', 'Calgary', 'AB', 'hg4536', 'user9@user.com', '141655555', '909077988', '9209371', 'K10377', 5);


insert into CustomerAccount (AccountID, CustomerID) values(1, 1);
insert into CustomerAccount (AccountID, CustomerID) values(2, 2);
insert into CustomerAccount (AccountID, CustomerID) values(3, 3);
insert into CustomerAccount (AccountID, CustomerID) values(4, 4);
insert into CustomerAccount (AccountID, CustomerID) values(5, 5);


insert into TransactionLog (TransactionDate, TransactionTypeID, TransactionAmount, NewBalance, AccountID, CustomerID, EmployeeID, UserLoginID ) values('2015/6/4 07:30:56', 1,15000.7, 7869878, 1, 1, 1, 1);
insert into TransactionLog (TransactionDate, TransactionTypeID, TransactionAmount, NewBalance, AccountID, CustomerID, EmployeeID, UserLoginID ) values('2018/6/9 12:34:57', 2,435435, 675687, 2, 2, 2, 2);
insert into TransactionLog (TransactionDate, TransactionTypeID, TransactionAmount, NewBalance, AccountID, CustomerID, EmployeeID, UserLoginID ) values('2016/4/5 02:14:00', 3,855869.3, 34512356, 3, 3, 3, 3);
insert into TransactionLog (TransactionDate, TransactionTypeID, TransactionAmount, NewBalance, AccountID, CustomerID, EmployeeID, UserLoginID ) values('2014/7/5 05:56:59', 4,1276303.6, 4643234, 4, 4, 4, 4);
insert into TransactionLog (TransactionDate, TransactionTypeID, TransactionAmount, NewBalance, AccountID, CustomerID, EmployeeID, UserLoginID ) values('2009/10/12 08:34:15', 5,1696737.9, 325344, 5, 5, 5, 5);


insert into OverDraftLog (OverDraftDate, OverDraftAmount, OverDraftTransactionXML) values('2015/6/4 07:30:56', 0, 'Clear');
insert into OverDraftLog (OverDraftDate, OverDraftAmount, OverDraftTransactionXML) values('2018/6/9 12:34:57', 5, 'Pending');
insert into OverDraftLog (OverDraftDate, OverDraftAmount, OverDraftTransactionXML) values('2016/4/5 02:14:00', 10, 'Clear');
insert into OverDraftLog (OverDraftDate, OverDraftAmount, OverDraftTransactionXML) values('2014/7/5 05:56:59', 15, 'Pending');
insert into OverDraftLog (OverDraftDate, OverDraftAmount, OverDraftTransactionXML) values('2009/10/12 08:34:15', 20, 'Clear');