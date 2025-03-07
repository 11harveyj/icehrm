use icehrm;

create table `CompanyStructures` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` tinytext not null,
  `description` text not null,
  `address` text default NULL,
  `type` enum('Company','Head Office','Regional Office','Department','Unit','Sub Unit','Other') default NULL,
  `country` varchar(2) not null default '0',
  `parent` bigint(20) NULL,
  `timezone` varchar(100) not null default 'Europe/London',
  `heads` varchar(255) NULL default NULL,
  CONSTRAINT `Fk_CompanyStructures_Own` FOREIGN KEY (`parent`) REFERENCES `CompanyStructures` (`id`),
  primary key  (`id`)
) engine=innodb default charset=utf8;

create table `Country` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`code` char(2) not null default '',
	`namecap` varchar(80) null default '',
	`name` varchar(80) not null default '',
	`iso3` char(3) default null,
	`numcode` smallint(6) default null,
	UNIQUE KEY `code` (`code`),
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `Province` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(40) not null default '',
	`code` char(2) not null default '',
	`country` char(2) not null default 'US',
	CONSTRAINT `Fk_Province_Country` FOREIGN KEY (`country`) REFERENCES `Country` (`code`),
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `CurrencyTypes` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`code` varchar(3) not null default '',
	`name` varchar(70) not null default '',
	primary key  (`id`),
	UNIQUE KEY `CurrencyTypes_code` (`code`)
) engine=innodb default charset=utf8;

create table `PayGrades` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) default null,
	`currency` varchar(3) not null,
	`min_salary` decimal(12,2) DEFAULT 0.00,
	`max_salary` decimal(12,2) DEFAULT 0.00,
	CONSTRAINT `Fk_PayGrades_CurrencyTypes` FOREIGN KEY (`currency`) REFERENCES `CurrencyTypes` (`code`),
	primary key(`id`)
) engine=innodb default charset=utf8;

create table `JobTitles` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`code` varchar(10) not null default '',
	`name` varchar(100) default null,
	`description` varchar(200) default null,
	`specification` varchar(400) default null,
	primary key(`id`)
) engine=innodb default charset=utf8;

create table `EmploymentStatus` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) default null,
	`description` varchar(400) default null,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `Skills` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) default null,
	`description` varchar(400) default null,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `Educations` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) default null,
	`description` varchar(400) default null,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `Certifications` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) default null,
	`description` varchar(400) default null,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `Languages` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) default null,
	`description` varchar(400) default null,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `SupportedLanguages` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) default null,
	`description` varchar(100) default null,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `Nationality` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) default null,
	primary key  (`id`)
) engine=innodb default charset=utf8;

CREATE TABLE `PayFrequency` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(200) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB default charset=utf8;

create table `Employees` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`employee_id` varchar(50) default null,
	`first_name` varchar(100) default '' not null,
	`middle_name` varchar(100) default null,
	`last_name` varchar(100) default null,
	`nationality` bigint(20) default null,
	`birthday` date default NULL,
	`gender` enum('Male','Female') default NULL,
	`marital_status` enum('Married','Single','Divorced','Widowed','Other') default NULL,
	`ssn_num` varchar(100) default NULL,
	`nic_num` varchar(100) default NULL,
	`other_id` varchar(100) default NULL,
	`driving_license` varchar(100) default NULL,
	`driving_license_exp_date` date default NULL,
	`employment_status` bigint(20) default null,
	`job_title` bigint(20) default null,
	`pay_grade` bigint(20) null,
	`work_station_id` varchar(100) default NULL,
	`address1` varchar(100) default NULL,
	`address2` varchar(100) default NULL,
	`city` varchar(150) default NULL,
	`country` char(2) default null,
	`province` bigint(20) default null,
	`postal_code` varchar(20) default null,
	`home_phone` varchar(50) default null,
	`mobile_phone` varchar(50) default null,
	`work_phone` varchar(50) default null,
	`work_email` varchar(100) default null,
	`private_email` varchar(100) default null,
	`joined_date` date default null,
	`confirmation_date` date default null,
	`supervisor` bigint(20) default null,
	`indirect_supervisors` varchar(250) default null,
	`department` bigint(20) default null,
	`custom1` varchar(250) default null,
	`custom2` varchar(250) default null,
	`custom3` varchar(250) default null,
	`custom4` varchar(250) default null,
	`custom5` varchar(250) default null,
	`custom6` varchar(250) default null,
	`custom7` varchar(250) default null,
	`custom8` varchar(250) default null,
	`custom9` varchar(250) default null,
	`custom10` varchar(250) default null,
	`termination_date` date default null,
	`notes` text default null,
	`status` enum('Active','Terminated') default 'Active',
	`ethnicity` bigint(20) default null,
	`immigration_status` bigint(20) default null,
	`approver1` bigint(20) default null,
	`approver2` bigint(20) default null,
	`approver3` bigint(20) default null,
	CONSTRAINT `Fk_Employee_Nationality` FOREIGN KEY (`nationality`) REFERENCES `Nationality` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT `Fk_Employee_JobTitle` FOREIGN KEY (`job_title`) REFERENCES `JobTitles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT `Fk_Employee_EmploymentStatus` FOREIGN KEY (`employment_status`) REFERENCES `EmploymentStatus` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT `Fk_Employee_Country` FOREIGN KEY (`country`) REFERENCES `Country` (`code`) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT `Fk_Employee_Province` FOREIGN KEY (`province`) REFERENCES `Province` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT `Fk_Employee_Supervisor` FOREIGN KEY (`supervisor`) REFERENCES `Employees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT `Fk_Employee_CompanyStructures` FOREIGN KEY (`department`) REFERENCES `CompanyStructures` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT `Fk_Employee_PayGrades` FOREIGN KEY (`pay_grade`) REFERENCES `PayGrades` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
	primary key  (`id`),
	unique key `employee_id` (`employee_id`)

) engine=innodb default charset=utf8;


create table `ArchivedEmployees` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`ref_id` bigint(20) NOT NULL,
	`employee_id` varchar(50) default null,
	`first_name` varchar(100) default '' not null,
	`last_name` varchar(100) default '' not null,
	`gender` enum('Male','Female') default NULL,
	`ssn_num` varchar(100) default '',
	`nic_num` varchar(100) default '',
	`other_id` varchar(100) default '',
	`work_email` varchar(100) default null,
	`joined_date` DATETIME default NULL,
	`confirmation_date` DATETIME default NULL,
	`supervisor` bigint(20) default null,
	`department` bigint(20) default null,
	`termination_date` DATETIME default NULL,
	`notes` text default null,
	`data` longtext default null,
	primary key  (`id`)

) engine=innodb default charset=utf8;

create table `UserRoles` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) default null,
	primary key  (`id`),
	unique key `name` (`name`)
) engine=innodb default charset=utf8;

create table `Users` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`username` varchar(100) default null,
	`email` varchar(100) default null,
	`password` varchar(100) default null,
	`employee` bigint(20) null,
	`default_module` bigint(20) null,
	`user_level` enum('Admin','Employee','Manager','Other') default NULL,
	`user_roles` text null,
	`last_login` datetime default NULL,
	`last_update` datetime default NULL,
	`created` datetime default NULL,
	`login_hash` varchar(64) default null,
	`lang` bigint(20) default null,
	CONSTRAINT `Fk_User_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT `Fk_User_SupportedLanguages` FOREIGN KEY (`lang`) REFERENCES `SupportedLanguages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
	primary key  (`id`),
	unique key `username` (`username`),
	INDEX login_hash_index (`login_hash`)
) engine=innodb default charset=utf8;




create table `EmployeeSkills` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`skill_id` bigint(20) NULL,
	`employee` bigint(20) NOT NULL,
	`details` varchar(400) default null,
	CONSTRAINT `Fk_EmployeeSkills_Skills` FOREIGN KEY (`skill_id`) REFERENCES `Skills` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `Fk_EmployeeSkills_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key  (`id`),
	unique key (`employee`,`skill_id`)
) engine=innodb default charset=utf8;

create table `EmployeeEducations` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`education_id` bigint(20) NULL,
	`employee` bigint(20) NOT NULL,
	`institute` varchar(400) default null,
	`date_start` date default NULL,
	`date_end` date default NULL,
	CONSTRAINT `Fk_EmployeeEducations_Educations` FOREIGN KEY (`education_id`) REFERENCES `Educations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `Fk_EmployeeEducations_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `EmployeeCertifications` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`certification_id` bigint(20) NULL,
	`employee` bigint(20) NOT NULL,
	`institute` varchar(400) default null,
	`date_start` date default NULL,
	`date_end` date default NULL,
	CONSTRAINT `Fk_EmployeeCertifications_Certifications` FOREIGN KEY (`certification_id`) REFERENCES `Certifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `Fk_EmployeeCertifications_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key  (`id`),
	unique key (`employee`,`certification_id`)
) engine=innodb default charset=utf8;


create table `EmployeeLanguages` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`language_id` bigint(20) NULL,
	`employee` bigint(20) NOT NULL,
	`reading` enum('Elementary Proficiency','Limited Working Proficiency','Professional Working Proficiency','Full Professional Proficiency','Native or Bilingual Proficiency') default NULL,
	`speaking` enum('Elementary Proficiency','Limited Working Proficiency','Professional Working Proficiency','Full Professional Proficiency','Native or Bilingual Proficiency') default NULL,
	`writing` enum('Elementary Proficiency','Limited Working Proficiency','Professional Working Proficiency','Full Professional Proficiency','Native or Bilingual Proficiency') default NULL,
	`understanding` enum('Elementary Proficiency','Limited Working Proficiency','Professional Working Proficiency','Full Professional Proficiency','Native or Bilingual Proficiency') default NULL,
	CONSTRAINT `Fk_EmployeeLanguages_Languages` FOREIGN KEY (`language_id`) REFERENCES `Languages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `Fk_EmployeeLanguages_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key  (`id`),
	unique key (`employee`,`language_id`)
) engine=innodb default charset=utf8;

create table `EmergencyContacts` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`employee` bigint(20) NOT NULL,
	`name` varchar(100) NOT NULL,
	`relationship` varchar(100) default null,
	`home_phone` varchar(15) default null,
	`work_phone` varchar(15) default null,
	`mobile_phone` varchar(15) default null,
	CONSTRAINT `Fk_EmergencyContacts_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `EmployeeDependents` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`employee` bigint(20) NOT NULL,
	`name` varchar(100) NOT NULL,
	`relationship` enum('Child','Spouse','Parent','Other') default NULL,
	`dob` date default NULL,
	`id_number` varchar(25) default null,
	CONSTRAINT `Fk_EmployeeDependents_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key  (`id`)
) engine=innodb default charset=utf8;



create table `LeaveTypes` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	`supervisor_leave_assign` enum('Yes','No') default 'Yes',
	`employee_can_apply` enum('Yes','No') default 'Yes',
	`apply_beyond_current` enum('Yes','No') default 'Yes',
	`leave_accrue` enum('No','Yes') default 'No',
	`carried_forward` enum('No','Yes') default 'No',
	`default_per_year` decimal(10,3) NOT NULL,
	`carried_forward_percentage` int(11) NULL default 0,
	`carried_forward_leave_availability` int(11) NULL default 365,
	`propotionate_on_joined_date` enum('No','Yes') default 'No',
	`send_notification_emails` enum('Yes','No') default 'Yes',
	`leave_group` bigint(20) NULL,
	`leave_color` varchar(10) NULL,
	`max_carried_forward_amount` int(11) NULL default 0,
	primary key  (`id`),
	unique key (`name`)
) engine=innodb default charset=utf8;

create table `LeaveRules` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`leave_type` bigint(20) NOT NULL,
	`job_title` bigint(20) NULL,
	`employment_status` bigint(20) NULL,
	`employee` bigint(20) NULL,
	`supervisor_leave_assign` enum('Yes','No') default 'Yes',
	`employee_can_apply` enum('Yes','No') default 'Yes',
	`apply_beyond_current` enum('Yes','No') default 'Yes',
	`leave_accrue` enum('No','Yes') default 'No',
	`carried_forward` enum('No','Yes') default 'No',
	`default_per_year` decimal(10,3) NOT NULL,
	`carried_forward_percentage` int(11) NULL default 0,
	`carried_forward_leave_availability` int(11) NULL default 365,
	`propotionate_on_joined_date` enum('No','Yes') default 'No',
	`leave_group` bigint(20) NULL,
	`max_carried_forward_amount` int(11) NULL default 0,
	primary key  (`id`)
) engine=innodb default charset=utf8;


create table `LeaveGroups` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	`details` text default null,
	`created` datetime NULL default NULL,
	`updated` datetime NULL default NULL,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `LeaveGroupEmployees` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`employee` bigint(20) NOT NULL,
	`leave_group` bigint(20) NOT NULL,
	`created` datetime NULL default NULL,
	`updated` datetime NULL default NULL,
	CONSTRAINT `Fk_LeaveGroupEmployees_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `Fk_LeaveGroupEmployees_LeaveGroups` FOREIGN KEY (`leave_group`) REFERENCES `LeaveGroups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key  (`id`),
	unique key `LeaveGroupEmployees_employee` (`employee`)
) engine=innodb default charset=utf8;

create table `LeavePeriods` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	`date_start` date default NULL,
	`date_end` date default NULL,
	`status` enum('Active','Inactive') default 'Inactive',
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `WorkDays` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	`status` enum('Full Day','Half Day','Non-working Day') default 'Full Day',
	`country` bigint(20) DEFAULT NULL,
	primary key  (`id`),
	unique key `workdays_name_country` (`name`,`country`)
) engine=innodb default charset=utf8;

create table `HoliDays` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	`dateh` date default NULL,
	`status` enum('Full Day','Half Day') default 'Full Day',
	`country` bigint(20) DEFAULT NULL,
	primary key  (`id`),
	unique key `holidays_dateh_country` (`dateh`,`country`)
) engine=innodb default charset=utf8;

create table `EmployeeLeaves` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`employee` bigint(20) NOT NULL,
	`leave_type` bigint(20) NOT NULL,
	`leave_period` bigint(20) NOT NULL,
	`date_start` date default NULL,
	`date_end` date default NULL,
	`details` text default null,
	`status` enum('Approved','Pending','Rejected','Cancellation Requested','Cancelled','Processing') default 'Pending',
	`attachment` varchar(100) NULL,
	CONSTRAINT `Fk_EmployeeLeaves_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `Fk_EmployeeLeaves_LeaveTypes` FOREIGN KEY (`leave_type`) REFERENCES `LeaveTypes` (`id`),
	CONSTRAINT `Fk_EmployeeLeaves_LeavePeriods` FOREIGN KEY (`leave_period`) REFERENCES `LeavePeriods` (`id`),
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `EmployeeLeaveLog` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`employee_leave` bigint(20) NOT NULL,
	`user_id` bigint(20) NULL,
	`data` varchar(500) NOT NULL,
	`status_from` enum('Approved','Pending','Rejected','Cancellation Requested','Cancelled','Processing') default 'Pending',
	`status_to` enum('Approved','Pending','Rejected','Cancellation Requested','Cancelled','Processing') default 'Pending',
	`created` datetime default NULL,
	CONSTRAINT `Fk_EmployeeLeaveLog_EmployeeLeaves` FOREIGN KEY (`employee_leave`) REFERENCES `EmployeeLeaves` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `Fk_EmployeeLeaveLog_Users` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `EmployeeLeaveDays` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`employee_leave` bigint(20) NOT NULL,
	`leave_date` date default NULL,
	`leave_type` enum('Full Day','Half Day - Morning','Half Day - Afternoon','1 Hour - Morning','2 Hours - Morning','3 Hours - Morning','1 Hour - Afternoon','2 Hours - Afternoon','3 Hours - Afternoon') NOT NULL,
	CONSTRAINT `Fk_EmployeeLeaveDays_EmployeeLeaves` FOREIGN KEY (`employee_leave`) REFERENCES `EmployeeLeaves` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `Files` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	`filename` varchar(100) NOT NULL,
	`employee` bigint(20) NULL,
	`file_group` varchar(100) NOT NULL,
	`size` bigint(20) NULL,
	`size_text` varchar(20) NULL,
	primary key  (`id`),
	unique key `filename` (`filename`)
) engine=innodb default charset=utf8;

create table `Clients` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	`details` text default null,
	`first_contact_date` date default NULL,
	`created` datetime default NULL,
	`address` text default null,
	`contact_number` varchar(25) NULL,
	`contact_email` varchar(100) NULL,
	`company_url` varchar(500) NULL,
	`status` enum('Active','Inactive') default 'Active',
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `Projects` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	`client` bigint(20) NULL,
	`details` text default null,
	`created` datetime default NULL,
	`status` enum('Active','On Hold','Completed', 'Dropped') default 'Active',
	CONSTRAINT `Fk_Projects_Client` FOREIGN KEY (`client`) REFERENCES `Clients` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `EmployeeTimeSheets` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`employee` bigint(20) NOT NULL,
	`date_start` date NOT NULL,
	`date_end` date NOT NULL,
	`status` enum('Approved','Pending','Rejected','Submitted') default 'Pending',
	CONSTRAINT `Fk_EmployeeTimeSheets_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	UNIQUE KEY `EmployeeTimeSheetsKey` (`employee`,`date_start`,`date_end`),
	KEY `EmployeeTimeSheets_date_end` (`date_end`),
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `EmployeeProjects` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`employee` bigint(20) NOT NULL,
	`project` bigint(20) NULL,
	`date_start` date NULL,
	`date_end` date NULL,
	`status` enum('Current','Inactive','Completed') default 'Current',
	`details` text default null,
	CONSTRAINT `Fk_EmployeeProjects_Projects` FOREIGN KEY (`project`) REFERENCES `Projects` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT `Fk_EmployeeProjects_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	UNIQUE KEY `EmployeeProjectsKey` (`employee`,`project`),
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `EmployeeTimeEntry` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`project` bigint(20) NULL,
	`employee` bigint(20) NOT NULL,
	`timesheet` bigint(20) NOT NULL,
	`details` text default null,
	`created` datetime default NULL,
	`date_start` datetime default NULL,
	`time_start` varchar(10) NOT NULL,
	`date_end` datetime default NULL,
	`time_end` varchar(10) NOT NULL,
	`status` enum('Active','Inactive') default 'Active',
	CONSTRAINT `Fk_EmployeeTimeEntry_Projects` FOREIGN KEY (`project`) REFERENCES `Projects` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT `Fk_EmployeeTimeEntry_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `Fk_EmployeeTimeEntry_EmployeeTimeSheets` FOREIGN KEY (`timesheet`) REFERENCES `EmployeeTimeSheets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	KEY `employee_project` (`employee`,`project`),
	KEY `employee_project_date_start` (`employee`,`project`,`date_start`),
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `Documents` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	`details` text default null,
	`expire_notification` enum('Yes','No') default 'Yes',
	`expire_notification_month` enum('Yes','No') default 'Yes',
	`expire_notification_week` enum('Yes','No') default 'Yes',
	`expire_notification_day` enum('Yes','No') default 'Yes',
	`sign` enum('Yes','No') default 'Yes',
	`sign_label` VARCHAR(500) default null,
	`created` DATETIME default NULL,
	`updated` DATETIME default NULL,
	primary key  (`id`)
) engine=innodb default charset=utf8;


create table `EmployeeDocuments` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`employee` bigint(20) NOT NULL,
	`document` bigint(20) NULL,
	`date_added` date NOT NULL,
	`valid_until` date NOT NULL,
	`status` enum('Active','Inactive','Draft') default 'Active',
	`details` text default null,
	`attachment` varchar(100) NULL,
	`signature` text default null,
	`expire_notification_last` int(4) NULL,
	CONSTRAINT `Fk_EmployeeDocuments_Documents` FOREIGN KEY (`document`) REFERENCES `Documents` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT `Fk_EmployeeDocuments_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key  (`id`),
	KEY `KEY_EmployeeDocuments_valid_until` (`valid_until`),
	KEY `KEY_EmployeeDocuments_valid_until_status` (`valid_until`,`status`,`expire_notification_last`)
) engine=innodb default charset=utf8;


create table `CompanyDocuments` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	`details` text default null,
	`valid_until` date NULL,
	`status` enum('Active','Inactive','Draft') default 'Active',
	`notify_employees` enum('Yes','No') default 'Yes',
	`attachment` varchar(100) NULL,
	`share_departments` varchar(100) NULL,
	`share_employees` varchar(100) NULL,
	`share_userlevel` varchar(100) NULL,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `CompanyLoans` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	`details` text default null,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `EmployeeCompanyLoans` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`employee` bigint(20) NOT NULL,
	`loan` bigint(20) NULL,
	`start_date` date NOT NULL,
	`last_installment_date` date NOT NULL,
	`period_months` bigint(20) NULL,
	`currency` bigint(20) NULL DEFAULT NULL,
	`amount` decimal(10,2) NOT NULL,
	`monthly_installment` decimal(10,2) NOT NULL,
	`status` enum('Approved','Repayment','Paid','Suspended') default 'Approved',
	`details` text default null,
	CONSTRAINT `Fk_EmployeeCompanyLoans_CompanyLoans` FOREIGN KEY (`loan`) REFERENCES `CompanyLoans` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT `Fk_EmployeeCompanyLoans_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `Settings` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	`value` text default null,
	`description` text default null,
	`meta` text default null,
	primary key  (`id`),
	UNIQUE KEY(`name`)
) engine=innodb default charset=utf8;


create table `Modules` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`menu` varchar(30) NOT NULL,
	`name` varchar(100) NOT NULL,
	`label` varchar(100) NOT NULL,
	`icon` VARCHAR( 50 ) NULL,
	`mod_group` varchar(30) NOT NULL,
	`mod_order` INT(11) NULL,
	`status` enum('Enabled','Disabled') default 'Enabled',
	`version` varchar(10) default '',
	`update_path` varchar(500) default '',
	`user_levels` varchar(500) NOT NULL,
	`user_roles` text null,
	primary key  (`id`),
	UNIQUE KEY `Modules_name_modgroup` (`name`,`mod_group`)
) engine=innodb default charset=utf8;

create table `Reports` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	`details` text default null,
	`parameters` text default null,
	`query` text default null,
	`paramOrder` varchar(500) NOT NULL,
	`type` enum('Query','Class') default 'Query',
	`report_group` varchar(500) NULL,
	`output` varchar(15) NOT NULL default 'CSV',
	primary key  (`id`),
	UNIQUE KEY `Reports_Name` (`name`)
) engine=innodb default charset=utf8;


create table `Attendance` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`employee` bigint(20) NOT NULL,
	`in_time` datetime default NULL,
	`out_time` datetime default NULL,
	`note` varchar(500) default null,
	CONSTRAINT `Fk_Attendance_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	KEY `in_time` (`in_time`),
	KEY `out_time` (`out_time`),
	KEY `employee_in_time` (`employee`,`in_time`),
	KEY `employee_out_time` (`employee`,`out_time`),
	primary key  (`id`)
) engine=innodb default charset=utf8;


create table `Permissions` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`user_level` enum('Admin','Employee','Manager') default NULL,
	`module_id` bigint(20) NOT NULL,
	`permission` varchar(200) default null,
	`meta` varchar(500) default null,
	`value` varchar(200) default null,
	UNIQUE KEY `Module_Permission` (`user_level`,`module_id`,`permission`),
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `DataEntryBackups` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`tableType` varchar(200) default null,
	`data` longtext default null,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `AuditLog` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`time` datetime default NULL,
	`user` bigint(20) NOT NULL,
	`ip` varchar(100) NULL,
	`type` varchar(100) NOT NULL,
	`employee` varchar(300) NULL,
	`details` text default null,
	CONSTRAINT `Fk_AuditLog_Users` FOREIGN KEY (`user`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key  (`id`)
) engine=innodb default charset=utf8;


create table `Notifications` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`time` datetime default NULL,
	`fromUser` bigint(20) NULL,
	`fromEmployee` bigint(20) NULL,
	`toUser` bigint(20) NOT NULL,
	`image` varchar(500) default null,
	`message` text default null,
	`action` text default null,
	`type` varchar(100) NULL,
	`status` enum('Unread','Read') default 'Unread',
	`employee` bigint(20) NULL,
	CONSTRAINT `Fk_Notifications_Users` FOREIGN KEY (`touser`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key  (`id`),
	KEY `toUser_time` (`toUser`,`time`),
	KEY `toUser_status_time` (`toUser`,`status`,`time`)
) engine=innodb default charset=utf8;

create table `Courses` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`code` varchar(300) NOT NULL,
	`name` varchar(300) NOT NULL,
	`description` text default null,
	`coordinator` bigint(20) NULL,
	`trainer` varchar(300) NULL,
	`trainer_info` text default null,
	`paymentType` enum('Company Sponsored','Paid by Employee') default 'Company Sponsored',
	`currency` varchar(3) null,
	`cost` decimal(12,2) DEFAULT 0.00,
	`status` enum('Active','Inactive') default 'Active',
	`created` datetime default NULL,
	`updated` datetime default NULL,
	CONSTRAINT `Fk_Courses_Employees` FOREIGN KEY (`coordinator`) REFERENCES `Employees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `TrainingSessions` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(300) NOT NULL,
	`course` bigint(20) NOT NULL,
	`description` text default null,
	`scheduled` datetime default NULL,
	`dueDate` datetime default NULL,
	`deliveryMethod` enum('Classroom','Self Study','Online') default 'Classroom',
	`deliveryLocation` varchar(500) NULL,
	`status` enum('Pending','Approved','Completed','Cancelled') default 'Pending',
	`attendanceType` enum('Sign Up','Assign') default 'Sign Up',
	`attachment` varchar(300) NULL,
	`created` datetime default NULL,
	`updated` datetime default NULL,
	`requireProof` enum('Yes','No') default 'Yes',
	CONSTRAINT `Fk_TrainingSessions_Courses` FOREIGN KEY (`course`) REFERENCES `Courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key  (`id`)
) engine=innodb default charset=utf8;


create table `EmployeeTrainingSessions` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`employee` bigint(20) NOT NULL,
	`trainingSession` bigint(20) NULL,
	`feedBack` varchar(1500) NULL,
	`status` enum('Scheduled','Attended','Not-Attended','Completed') default 'Scheduled',
	`proof` varchar(300) NULL,
	CONSTRAINT `Fk_EmployeeTrainingSessions_TrainingSessions` FOREIGN KEY (`trainingSession`) REFERENCES `TrainingSessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `Fk_EmployeeTrainingSessions_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key  (`id`)
) engine=innodb default charset=utf8;


create table `ImmigrationDocuments` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	`details` text default null,
	`required` enum('Yes','No') default 'Yes',
	`alert_on_missing` enum('Yes','No') default 'Yes',
	`alert_before_expiry` enum('Yes','No') default 'Yes',
	`alert_before_day_number` int(11) NOT NULL,
	`created` datetime NULL default NULL,
	`updated` datetime NULL default NULL,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `EmployeeImmigrations` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`employee` bigint(20) NOT NULL,
	`document` bigint(20) NULL,
	`documentname` varchar(150) NOT NULL,
	`valid_until` date NOT NULL,
	`status` enum('Active','Inactive','Draft') default 'Active',
	`details` text default null,
	`attachment1` varchar(100) NULL,
	`attachment2` varchar(100) NULL,
	`attachment3` varchar(100) NULL,
	`created` datetime NULL default NULL,
	`updated` datetime NULL default NULL,
	CONSTRAINT `Fk_EmployeeImmigrations_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `Fk_EmployeeImmigrations_ImmigrationDocuments` FOREIGN KEY (`document`) REFERENCES `ImmigrationDocuments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
	primary key  (`id`)
) engine=innodb default charset=utf8;


create table `EmployeeTravelRecords` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`employee` bigint(20) NOT NULL,
	`type` enum('Local','International') default 'Local',
	`purpose` varchar(200) NOT NULL,
	`travel_from` varchar(200) NOT NULL,
	`travel_to` varchar(200) NOT NULL,
	`travel_date` datetime NULL default NULL,
	`return_date` datetime NULL default NULL,
	`details` varchar(500) default null,
	`funding` decimal(10,3) NULL,
	`currency` bigint(20) NULL,
	`attachment1` varchar(100) NULL,
	`attachment2` varchar(100) NULL,
	`attachment3` varchar(100) NULL,
	`created` datetime NULL default NULL,
	`updated` datetime NULL default NULL,
	`status` enum('Approved','Pending','Rejected','Cancellation Requested','Cancelled','Processing') default 'Pending',
	CONSTRAINT `Fk_EmployeeTravelRecords_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key  (`id`)
) engine=innodb default charset=utf8;


create table `RestAccessTokens` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`userId` bigint(20) NOT NULL,
	`hash` varchar(32) default null,
	`token` varchar(500) default null,
	`created` DATETIME default NULL,
	`updated` DATETIME default NULL,
	primary key  (`id`),
	unique key `userId` (`userId`)
) engine=innodb default charset=utf8;

create table `FieldNameMappings` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`type` varchar(20) NOT NULL,
	`name` varchar(20) NOT NULL,
	`textOrig` varchar(200) default null,
	`textMapped` varchar(200) default null,
	`display` enum('Form','Table and Form','Hidden') default 'Form',
	`created` DATETIME default NULL,
	`updated` DATETIME default NULL,
	primary key  (`id`),
	unique key `name` (`name`)
) engine=innodb default charset=utf8;

create table `CustomFields` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`type` varchar(20) NOT NULL,
	`name` varchar(20) NOT NULL,
	`data` text default null,
	`display` enum('Form','Table and Form','Hidden') default 'Form',
	`created` DATETIME default NULL,
	`updated` DATETIME default NULL,
	`field_type` varchar(20) NULL,
	`field_label` varchar(50) NULL,
	`field_validation` varchar(50) NULL,
	`field_options` varchar(500) NULL,
	`display_order` int(11) default 0,
  `display_section` varchar(50) NULL,
  primary key  (`id`),
	unique key `CustomFields_name` (`type`,`name`)
) engine=innodb default charset=utf8;


create table `SalaryComponentType` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`code` varchar(10) NOT NULL,
	`name` varchar(100) NOT NULL,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `SalaryComponent` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	`componentType` bigint(20) NULL,
	`details` text default null,
	CONSTRAINT `Fk_SalaryComponent_SalaryComponentType` FOREIGN KEY (`componentType`) REFERENCES `SalaryComponentType` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `ImmigrationStatus` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `Ethnicity` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `EmployeeImmigrationStatus` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`employee` bigint(20) NOT NULL,
	`status` bigint(20) NOT NULL,
	CONSTRAINT `Fk_EmployeeImmigrationStatus_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `Fk_EmployeeImmigrationStatus_Type` FOREIGN KEY (`status`) REFERENCES `ImmigrationStatus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `EmployeeEthnicity` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`employee` bigint(20) NOT NULL,
	`ethnicity` bigint(20) NOT NULL,
	CONSTRAINT `Fk_EmployeeEthnicity_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `Fk_EmployeeEthnicity_Ethnicity` FOREIGN KEY (`ethnicity`) REFERENCES `Ethnicity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key  (`id`)
) engine=innodb default charset=utf8;


create table `EmployeeSalary` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`employee` bigint(20) NOT NULL,
	`component` bigint(20) NOT NULL,
	`pay_frequency` enum('Hourly','Daily','Bi Weekly','Weekly','Semi Monthly','Monthly') default NULL,
	`currency` bigint(20) NULL,
	`amount` decimal(10,2) NOT NULL,
	`details` text default null,
	CONSTRAINT `Fk_EmployeeSalary_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `Fk_EmployeeSalary_Currency` FOREIGN KEY (`currency`) REFERENCES `CurrencyTypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `DeductionGroup` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	`description` varchar(100) NOT NULL,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `Deductions` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	`componentType` varchar(250) NULL,
	`component` varchar(250) NULL,
	`payrollColumn` int(11) DEFAULT NULL,
	`rangeAmounts` text default null,
	`deduction_group` bigint(20) NULL,
	CONSTRAINT `Fk_Deductions_DeductionGroup` FOREIGN KEY (`deduction_group`) REFERENCES `DeductionGroup` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
	primary key  (`id`)
) engine=innodb default charset=utf8;




create table `PayrollEmployees` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`employee` bigint(20) NOT NULL,
	`pay_frequency` int(11) default null,
	`currency` bigint(20) NULL,
	`deduction_exemptions` varchar(250) default null,
	`deduction_allowed` varchar(250) default null,
	`deduction_group` bigint(20) NULL,
	CONSTRAINT `Fk_PayrollEmployee_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `Fk_PayrollEmployees_DeductionGroup` FOREIGN KEY (`deduction_group`) REFERENCES `DeductionGroup` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
	primary key  (`id`),
	unique key `PayrollEmployees_employee` (`employee`)
) engine=innodb default charset=utf8;

CREATE TABLE `PayrollColumnTemplates` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(50) DEFAULT NULL,
	`columns` varchar(500) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB default charset=utf8;

create table `Payroll` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(200) NULL,
	`pay_period` bigint(20) NOT NULL,
	`department` bigint(20) NOT NULL,
	`column_template` bigint(20) NULL,
	`columns` varchar(500) DEFAULT NULL,
	`date_start` DATE NULL default NULL,
	`date_end` DATE NULL default NULL,
	`status` enum('Draft','Completed','Processing') default 'Draft',
	`payslipTemplate` bigint(20) NULL,
	primary key  (`id`)
) engine=innodb default charset=utf8;


CREATE TABLE `PayrollData` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`payroll` bigint(20) NOT NULL,
	`employee` bigint(20) NOT NULL,
	`payroll_item` int(11) NOT NULL,
	`amount` varchar(25) DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `PayrollDataUniqueKey` (`payroll`,`employee`,`payroll_item`),
	CONSTRAINT `Fk_PayrollData_Payroll` FOREIGN KEY (`payroll`) REFERENCES `Payroll` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB default charset=utf8;


CREATE TABLE `PayrollColumns` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(50) DEFAULT NULL,
	`calculation_hook` varchar(200) DEFAULT NULL,
	`salary_components` varchar(500) DEFAULT NULL,
	`deductions` varchar(500) DEFAULT NULL,
	`add_columns` varchar(500) DEFAULT NULL,
	`sub_columns` varchar(500) DEFAULT NULL,
	`colorder` int(11) DEFAULT NULL,
	`editable` enum('Yes','No') default 'Yes',
	`enabled` enum('Yes','No') default 'Yes',
	`default_value` varchar(25) DEFAULT NULL,
	`calculation_columns` varchar(500) DEFAULT NULL,
	`calculation_function` varchar(100) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB default charset=utf8;




create table `EmployementType` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(250) not null default '',
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `Industry` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(250) not null default '',
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `ExperienceLevel` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(250) not null default '',
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `JobFunction` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(250) not null default '',
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `EducationLevel` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(250) not null default '',
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `Benifits` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(250) not null default '',
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `Tags` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(250) not null default '',
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `Job` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`title` varchar(200) NOT NULL,
	`shortDescription` text DEFAULT NULL,
	`description` text DEFAULT NULL,
	`requirements` text DEFAULT NULL,
	`benefits` text DEFAULT NULL,
	`country` bigint(20) DEFAULT NULL,
	`company` bigint(20) DEFAULT NULL,
	`department` VARCHAR(100) NULL,
	`code` VARCHAR(20) NULL,
	`employementType` bigint(20) DEFAULT NULL,
	`industry` bigint(20) DEFAULT NULL,
	`experienceLevel` bigint(20) DEFAULT NULL,
	`jobFunction` bigint(20) DEFAULT NULL,
	`educationLevel` bigint(20) DEFAULT NULL,
	`currency` bigint(20) DEFAULT NULL,
	`showSalary` enum('Yes','No') default NULL,
	`salaryMin` bigint(20) DEFAULT NULL,
	`salaryMax` bigint(20) DEFAULT NULL,
	`keywords` text DEFAULT NULL,
	`status` enum('Active','On hold','Closed') default NULL,
	`closingDate` DATETIME default NULL,
	`attachment` varchar(100) NULL,
	`display` varchar(200) NOT NULL,
	`postedBy` bigint(20) DEFAULT NULL,
	INDEX `Job_status` (`status`),
	primary key  (`id`)
) engine=innodb default charset=utf8;


create table `Candidates` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`first_name` varchar(100) default '' not null,
	`last_name` varchar(100) default '' not null,
	`nationality` bigint(20) default null,
	`birthday` DATETIME default null,
	`gender` enum('Male','Female') default NULL,
	`marital_status` enum('Married','Single','Divorced','Widowed','Other') default NULL,
	`address1` varchar(100) default '',
	`address2` varchar(100) default '',
	`city` varchar(150) default '',
	`country` char(2) default null,
	`province` bigint(20) default null,
	`postal_code` varchar(20) default null,
	`email` varchar(200) default null,
	`home_phone` varchar(50) default null,
	`mobile_phone` varchar(50) default null,
	`cv_title` varchar(200) default '' not null,
	`cv` varchar(150) NULL,
	`cvtext` text NULL,
	`industry` text DEFAULT NULL,
	`profileImage` varchar(150) NULL,
	`head_line` text DEFAULT NULL,
	`objective` text DEFAULT NULL,
	`work_history` text DEFAULT NULL,
	`education` text DEFAULT NULL,
	`skills` text DEFAULT NULL,
	`referees` text DEFAULT NULL,
	`linkedInUrl` varchar(500) DEFAULT NULL,
	`linkedInData` text DEFAULT NULL,
	`totalYearsOfExperience` int(11) default null,
	`totalMonthsOfExperience` int(11) default null,
	`htmlCVData` longtext DEFAULT NULL,
	`generatedCVFile` varchar(150) DEFAULT NULL,
	`created` DATETIME default NULL,
	`updated` DATETIME default NULL,
	`expectedSalary` int(11) default null,
	`preferedPositions` text default null,
	`preferedJobtype` varchar(60) default null,
	`preferedCountries` text default null,
	`tags` text default null,
	`notes` text default null,
	`calls` text default null,
	`age` int(11) default null,
	`hash` varchar(100) DEFAULT NULL,
	`linkedInProfileLink` varchar(250) DEFAULT NULL,
	`linkedInProfileId` varchar(50) DEFAULT NULL,
	`facebookProfileLink` varchar(250) DEFAULT NULL,
	`facebookProfileId` varchar(50) DEFAULT NULL,
	`twitterProfileLink` varchar(250) DEFAULT NULL,
	`twitterProfileId` varchar(50) DEFAULT NULL,
	`googleProfileLink` varchar(250) DEFAULT NULL,
	`googleProfileId` varchar(50) DEFAULT NULL,
	primary key  (`id`)

) engine=innodb default charset=utf8;


create table `Applications` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`job` bigint(20) NOT NULL,
	`candidate` bigint(20) DEFAULT NULL,
	`created` DATETIME default NULL,
	`referredByEmail` varchar(200) DEFAULT NULL,
	`notes` text DEFAULT NULL,
	primary key  (`id`),
	unique key  (`job`,`candidate`),
	CONSTRAINT `Fk_Applications_Job` FOREIGN KEY (`job`) REFERENCES `Job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `Fk_Applications_Candidates` FOREIGN KEY (`candidate`) REFERENCES `Candidates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) engine=innodb default charset=utf8;

create table `Interviews` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`job` bigint(20) NOT NULL,
	`candidate` bigint(20) DEFAULT NULL,
	`level` varchar(100) DEFAULT NULL,
	`created` DATETIME default NULL,
	`updated` DATETIME default NULL,
	`scheduled` DATETIME default NULL,
	`location` varchar(500) DEFAULT NULL,
	`mapId` bigint(20) NULL,
	`status` varchar(100) default null,
	`notes` text DEFAULT NULL,
	primary key  (`id`),
	CONSTRAINT `Fk_Interviews_Job` FOREIGN KEY (`job`) REFERENCES `Job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `Fk_Interviews_Candidates` FOREIGN KEY (`candidate`) REFERENCES `Candidates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) engine=innodb default charset=utf8;


create table `Calls` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`job` bigint(20) NOT NULL,
	`candidate` bigint(20) DEFAULT NULL,
	`phone` varchar(20) default null,
	`created` DATETIME default NULL,
	`updated` DATETIME default NULL,
	`status` varchar(100) default null,
	`notes` text DEFAULT NULL,
	primary key  (`id`),
	CONSTRAINT `Fk_Calls_Job` FOREIGN KEY (`job`) REFERENCES `Job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `Fk_Calls_Candidates` FOREIGN KEY (`candidate`) REFERENCES `Candidates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) engine=innodb default charset=utf8;


create table `LeaveStartingBalance` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`leave_type` bigint(20) NOT NULL,
	`employee` bigint(20) NULL,
	`leave_period` bigint(20) NOT NULL,
	`amount` decimal(10,3) NOT NULL,
	`note` text DEFAULT NULL,
	`created` datetime default NULL,
	`updated` datetime default NULL,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `Crons` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	`class` varchar(100) NOT NULL,
	`lastrun` DATETIME default NULL,
	`frequency` int(4) NOT NULL,
	`time` varchar(50) NOT NULL,
	`type` enum('Minutely','Hourly','Daily','Weekly','Monthly','Yearly') default 'Hourly',
	`status` enum('Enabled','Disabled') default 'Enabled',
	primary key  (`id`),
	key `KEY_Crons_frequency` (`frequency`)
) engine=innodb default charset=utf8;

create table `Emails` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`subject` varchar(300) NOT NULL,
	`toEmail` varchar(300) NOT NULL,
	`template` text NULL,
	`params` text NULL,
	`cclist` varchar(500) NULL,
	`bcclist` varchar(500) NULL,
	`error` varchar(500) NULL,
	`created` DATETIME default NULL,
	`updated` DATETIME default NULL,
	`status` enum('Pending','Sent','Error') default 'Pending',
	primary key  (`id`),
	key `KEY_Emails_status` (`status`),
	key `KEY_Emails_created` (`created`)
) engine=innodb default charset=utf8;


create table `ExpensesCategories` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(500) NOT NULL,
	`created` datetime NULL default NULL,
	`updated` datetime NULL default NULL,
	`pre_approve` enum('Yes','No') default 'Yes',
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `ExpensesPaymentMethods` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(500) NOT NULL,
	`created` datetime NULL default NULL,
	`updated` datetime NULL default NULL,
	primary key  (`id`)
) engine=innodb default charset=utf8;


create table `EmployeeExpenses` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`employee` bigint(20) NOT NULL,
	`expense_date` date NULL default NULL,
	`payment_method` bigint(20) NOT NULL,
	`transaction_no` varchar(300) NOT NULL,
	`payee` varchar(500) NOT NULL,
	`category` bigint(20) NOT NULL,
	`notes` text,
	`amount` decimal(10,3) NULL,
	`currency` bigint(20) NULL,
	`attachment1` varchar(100) NULL,
	`attachment2` varchar(100) NULL,
	`attachment3` varchar(100) NULL,
	`created` datetime NULL default NULL,
	`updated` datetime NULL default NULL,
	`status` enum('Approved','Pending','Rejected','Cancellation Requested','Cancelled','Processing') default 'Pending',
	CONSTRAINT `Fk_EmployeeExpenses_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `Fk_EmployeeExpenses_pm` FOREIGN KEY (`payment_method`) REFERENCES `ExpensesPaymentMethods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `Fk_EmployeeExpenses_category` FOREIGN KEY (`category`) REFERENCES `ExpensesCategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key  (`id`)
) engine=innodb default charset=utf8;


create table `Timezones` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) not null default '',
	`details` varchar(255) not null default '',
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `EmployeeDataHistory` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`type` varchar(100) not null,
	`employee` bigint(20) NOT NULL,
	`field` varchar(100) not null,
	`old_value` varchar(500) default null,
	`new_value` varchar(500) default null,
	`description` varchar(800) default null,
	`user` bigint(20) NULL,
	`updated` datetime default NULL,
	`created` datetime default NULL,
	CONSTRAINT `Fk_EmployeeDataHistory_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `Fk_EmployeeDataHistory_Users` FOREIGN KEY (`user`) REFERENCES `Users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
	primary key  (`id`)
) engine=innodb default charset=utf8;


create table `EmployeeAttendanceSheets` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`employee` bigint(20) NOT NULL,
	`date_start` date NOT NULL,
	`date_end` date NOT NULL,
	`status` enum('Approved','Pending','Rejected','Submitted') default 'Pending',
	CONSTRAINT `Fk_EmployeeAttendanceSheets_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	UNIQUE KEY `EmployeeAttendanceSheetsKey` (`employee`,`date_start`,`date_end`),
	KEY `EmployeeAttendanceSheets_date_end` (`date_end`),
	primary key  (`id`)
) engine=innodb default charset=utf8;


create table `CustomFieldValues` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`type` varchar(20) not null,
	`name` varchar(60) not null,
	`object_id` varchar(60) not null,
	`value` text default NULL,
	`updated` datetime default NULL,
	`created` datetime default NULL,
	primary key  (`id`),
	UNIQUE key `CustomFields_type_name_object_id` (`type`,`name`,`object_id`),
	INDEX `CustomFields_type_object_id` (`type`,`object_id`)
) engine=innodb default charset=utf8;


create table `DataImport` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) not null,
	`dataType` varchar(60) not null,
	`details` text default NULL,
	`columns` text default NULL,
	`updated` datetime default NULL,
	`created` datetime default NULL,
	primary key  (`id`)
) engine=innodb default charset=utf8;


create table `DataImportFiles` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(60) not null,
	`data_import_definition` varchar(200) not null,
	`status` varchar(15) null,
	`file` varchar(100) null,
	`details` text default NULL,
	`updated` datetime default NULL,
	`created` datetime default NULL,
	primary key  (`id`)
) engine=innodb default charset=utf8;


create table `UserReports` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	`details` text default null,
	`parameters` text default null,
	`query` text default null,
	`paramOrder` varchar(500) NOT NULL,
	`type` enum('Query','Class') default 'Query',
	`report_group` varchar(500) NULL,
	`output` varchar(15) NOT NULL default 'CSV',
	primary key  (`id`),
	UNIQUE KEY `UserReports_Name` (`name`)
) engine=innodb default charset=utf8;


create table `ReportFiles` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`employee` bigint(20) NULL,
	`name` varchar(100) NOT NULL,
	`attachment` varchar(100) NOT NULL,
	`created` datetime default NULL,
	unique key `ReportFiles_attachment` (`attachment`),
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `PayslipTemplates` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	`data` longtext NULL,
	`status` enum('Show','Hide') default 'Show',
	`created` datetime default NULL,
	`updated` datetime default NULL,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `EmployeeApprovals` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`type` varchar(100) NOT NULL,
	`element` bigint(20) NOT NULL,
	`approver` bigint(20) NULL,
	`level` int(11) default 0,
	`status` int(11) default 0,
	`active` int(11) default 0,
	`created` datetime default NULL,
	`updated` datetime default NULL,
	UNIQUE key `EmployeeApprovals_type_element_level` (`type`,`element`,`level`),
	INDEX `EmployeeApprovals_type_element_status_level` (`type`,`element`,`status`,`level`),
	INDEX `EmployeeApprovals_type_element` (`type`,`element`),
	INDEX `EmployeeApprovals_type` (`type`),
	primary key  (`id`)
) engine=innodb default charset=utf8;


create table `StatusChangeLogs` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`type` varchar(100) NOT NULL,
	`element` bigint(20) NOT NULL,
	`user_id` bigint(20) NULL,
	`data` varchar(500) NOT NULL,
	`status_from` enum('Approved','Pending','Rejected','Cancellation Requested','Cancelled','Processing') default 'Pending',
	`status_to` enum('Approved','Pending','Rejected','Cancellation Requested','Cancelled','Processing') default 'Pending',
	`created` datetime default NULL,
	INDEX `EmployeeApprovals_type_element` (`type`,`element`),
	primary key  (`id`)
) engine=innodb default charset=utf8;


create table `OvertimeCategories` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(500) NOT NULL,
	`created` datetime NULL default NULL,
	`updated` datetime NULL default NULL,
	primary key  (`id`)
) engine=innodb default charset=utf8;


create table `EmployeeOvertime` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`employee` bigint(20) NOT NULL,
	`start_time` datetime NULL default NULL,
	`end_time` datetime NULL default NULL,
	`category` bigint(20) NOT NULL,
	`project` bigint(20) NULL,
	`notes` text NULL,
	`created` datetime NULL default NULL,
	`updated` datetime NULL default NULL,
	`status` enum('Approved','Pending','Rejected','Cancellation Requested','Cancelled','Processing') default 'Pending',
	CONSTRAINT `Fk_EmployeeOvertime_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `Fk_EmployeeOvertime_Category` FOREIGN KEY (`category`) REFERENCES `OvertimeCategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `Forms` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	`description` varchar(500) NULL,
	`items` text NULL,
	`created` datetime NULL default NULL,
	`updated` datetime NULL default NULL,
	primary key  (`id`)
) engine=innodb default charset=utf8;

create table `EmployeeForms` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`employee` bigint(20) NOT NULL,
	`form` bigint(20) NOT NULL,
	`status` enum('Pending','Completed') default 'Pending',
	`created` datetime NULL default NULL,
	`updated` datetime NULL default NULL,
	CONSTRAINT `Fk_EmployeeForms_Employee` FOREIGN KEY (`employee`) REFERENCES `Employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `Fk_EmployeeForms_Forms` FOREIGN KEY (`form`) REFERENCES `Forms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	primary key  (`id`)
) engine=innodb default charset=utf8;


create table `Migrations` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`file` varchar(50) NOT NULL,
	`version` int(11) NOT NULL,
	`created` DATETIME default NULL,
	`updated` DATETIME default NULL,
	`status` enum('Pending','Up','Down','UpError','DownError') default 'Pending',
	`last_error` varchar(500) NULL,
	primary key  (`id`),
	unique key `KEY_Migrations_file` (`file`),
	index `KEY_Migrations_status` (`status`),
	index `KEY_Migrations_version` (`version`)
) engine=innodb default charset=utf8;



INSERT INTO `Timezones`(`id`, `name`, `details`) VALUES
  (1, 'Pacific/Midway', '(GMT-11:00) Midway Island'),
  (2, 'US/Samoa', '(GMT-11:00) Samoa'),
  (3, 'US/Hawaii', '(GMT-10:00) Hawaii'),
  (4, 'US/Alaska', '(GMT-09:00) Alaska'),
  (5, 'US/Pacific', '(GMT-08:00) Pacific Time (US, Canada)'),
  (6, 'America/Tijuana', '(GMT-08:00) Tijuana'),
  (7, 'US/Arizona', '(GMT-07:00) Arizona'),
  (8, 'US/Mountain', '(GMT-07:00) Mountain Time (US, Canada)'),
  (9, 'America/Chihuahua', '(GMT-07:00) Chihuahua'),
  (10, 'America/Mazatlan', '(GMT-07:00) Mazatlan'),
  (11, 'America/Mexico_City', '(GMT-06:00) Mexico City'),
  (12, 'America/Monterrey', '(GMT-06:00) Monterrey'),
  (13, 'Canada/Saskatchewan', '(GMT-06:00) Saskatchewan'),
  (14, 'US/Central', '(GMT-06:00) Central Time (US , Canada)'),
  (15, 'US/Eastern', '(GMT-05:00) Eastern Time (US , Canada)'),
  (16, 'US/East-Indiana', '(GMT-05:00) Indiana (East)'),
  (17, 'America/Bogota', '(GMT-05:00) Bogota'),
  (18, 'America/Lima', '(GMT-05:00) Lima'),
  (19, 'America/Caracas', '(GMT-04:30) Caracas'),
  (20, 'Canada/Atlantic', '(GMT-04:00) Atlantic Time (Canada)'),
  (21, 'America/La_Paz', '(GMT-04:00) La Paz'),
  (22, 'America/Santiago', '(GMT-04:00) Santiago'),
  (23, 'Canada/Newfoundland', '(GMT-03:30) Newfoundland'),
  (24, 'America/Buenos_Aires', '(GMT-03:00) Buenos Aires'),
  (25, 'Greenland', '(GMT-03:00) Greenland'),
  (26, 'Atlantic/Stanley', '(GMT-02:00) Stanley'),
  (27, 'Atlantic/Azores', '(GMT-01:00) Azores'),
  (28, 'Atlantic/Cape_Verde', '(GMT-01:00) Cape Verde Is.'),
  (29, 'Africa/Casablanca', '(GMT) Casablanca'),
  (30, 'Europe/Dublin', '(GMT) Dublin'),
  (31, 'Europe/Lisbon', '(GMT) Lisbon'),
  (32, 'Europe/London', '(GMT) London'),
  (33, 'Africa/Monrovia', '(GMT) Monrovia'),
  (34, 'Europe/Amsterdam', '(GMT+01:00) Amsterdam'),
  (35, 'Europe/Belgrade', '(GMT+01:00) Belgrade'),
  (36, 'Europe/Berlin', '(GMT+01:00) Berlin'),
  (37, 'Europe/Bratislava', '(GMT+01:00) Bratislava'),
  (38, 'Europe/Brussels', '(GMT+01:00) Brussels'),
  (39, 'Europe/Budapest', '(GMT+01:00) Budapest'),
  (40, 'Europe/Copenhagen', '(GMT+01:00) Copenhagen'),
  (41, 'Europe/Ljubljana', '(GMT+01:00) Ljubljana'),
  (42, 'Europe/Madrid', '(GMT+01:00) Madrid'),
  (43, 'Europe/Paris', '(GMT+01:00) Paris'),
  (44, 'Europe/Prague', '(GMT+01:00) Prague'),
  (45, 'Europe/Rome', '(GMT+01:00) Rome'),
  (46, 'Europe/Sarajevo', '(GMT+01:00) Sarajevo'),
  (47, 'Europe/Skopje', '(GMT+01:00) Skopje'),
  (48, 'Europe/Stockholm', '(GMT+01:00) Stockholm'),
  (49, 'Europe/Vienna', '(GMT+01:00) Vienna'),
  (50, 'Europe/Warsaw', '(GMT+01:00) Warsaw'),
  (51, 'Europe/Zagreb', '(GMT+01:00) Zagreb'),
  (52, 'Europe/Athens', '(GMT+02:00) Athens'),
  (53, 'Europe/Bucharest', '(GMT+02:00) Bucharest'),
  (54, 'Africa/Cairo', '(GMT+02:00) Cairo'),
  (55, 'Africa/Harare', '(GMT+02:00) Harare'),
  (56, 'Europe/Helsinki', '(GMT+02:00) Helsinki'),
  (57, 'Europe/Istanbul', '(GMT+02:00) Istanbul'),
  (58, 'Asia/Jerusalem', '(GMT+02:00) Jerusalem'),
  (59, 'Europe/Kiev', '(GMT+02:00) Kyiv'),
  (60, 'Europe/Minsk', '(GMT+02:00) Minsk'),
  (61, 'Europe/Riga', '(GMT+02:00) Riga'),
  (62, 'Europe/Sofia', '(GMT+02:00) Sofia'),
  (63, 'Europe/Tallinn', '(GMT+02:00) Tallinn'),
  (64, 'Europe/Vilnius', '(GMT+02:00) Vilnius'),
  (65, 'Asia/Baghdad', '(GMT+03:00) Baghdad'),
  (66, 'Asia/Kuwait', '(GMT+03:00) Kuwait'),
  (67, 'Africa/Nairobi', '(GMT+03:00) Nairobi'),
  (68, 'Asia/Riyadh', '(GMT+03:00) Riyadh'),
  (69, 'Europe/Moscow', '(GMT+03:00) Moscow'),
  (70, 'Asia/Tehran', '(GMT+03:30) Tehran'),
  (71, 'Asia/Baku', '(GMT+04:00) Baku'),
  (72, 'Europe/Volgograd', '(GMT+04:00) Volgograd'),
  (73, 'Asia/Muscat', '(GMT+04:00) Muscat'),
  (74, 'Asia/Tbilisi', '(GMT+04:00) Tbilisi'),
  (75, 'Asia/Yerevan', '(GMT+04:00) Yerevan'),
  (76, 'Asia/Kabul', '(GMT+04:30) Kabul'),
  (77, 'Asia/Karachi', '(GMT+05:00) Karachi'),
  (78, 'Asia/Tashkent', '(GMT+05:00) Tashkent'),
  (79, 'Asia/Kolkata', '(GMT+05:30) Kolkata'),
  (80, 'Asia/Kathmandu', '(GMT+05:45) Kathmandu'),
  (81, 'Asia/Yekaterinburg', '(GMT+06:00) Ekaterinburg'),
  (82, 'Asia/Almaty', '(GMT+06:00) Almaty'),
  (83, 'Asia/Dhaka', '(GMT+06:00) Dhaka'),
  (84, 'Asia/Novosibirsk', '(GMT+07:00) Novosibirsk'),
  (85, 'Asia/Bangkok', '(GMT+07:00) Bangkok'),
  (86, 'Asia/Jakarta', '(GMT+07:00) Jakarta'),
  (87, 'Asia/Krasnoyarsk', '(GMT+08:00) Krasnoyarsk'),
  (88, 'Asia/Chongqing', '(GMT+08:00) Chongqing'),
  (89, 'Asia/Hong_Kong', '(GMT+08:00) Hong Kong'),
  (90, 'Asia/Kuala_Lumpur', '(GMT+08:00) Kuala Lumpur'),
  (91, 'Australia/Perth', '(GMT+08:00) Perth'),
  (92, 'Asia/Singapore', '(GMT+08:00) Singapore'),
  (93, 'Asia/Taipei', '(GMT+08:00) Taipei'),
  (94, 'Asia/Ulaanbaatar', '(GMT+08:00) Ulaan Bataar'),
  (95, 'Asia/Urumqi', '(GMT+08:00) Urumqi'),
  (96, 'Asia/Irkutsk', '(GMT+09:00) Irkutsk'),
  (97, 'Asia/Seoul', '(GMT+09:00) Seoul'),
  (98, 'Asia/Tokyo', '(GMT+09:00) Tokyo'),
  (99, 'Australia/Adelaide', '(GMT+09:30) Adelaide'),
  (100, 'Australia/Darwin', '(GMT+09:30) Darwin'),
  (101, 'Asia/Yakutsk', '(GMT+10:00) Yakutsk'),
  (102, 'Australia/Brisbane', '(GMT+10:00) Brisbane'),
  (103, 'Australia/Canberra', '(GMT+10:00) Canberra'),
  (104, 'Pacific/Guam', '(GMT+10:00) Guam'),
  (105, 'Australia/Hobart', '(GMT+10:00) Hobart'),
  (106, 'Australia/Melbourne', '(GMT+10:00) Melbourne'),
  (107, 'Pacific/Port_Moresby', '(GMT+10:00) Port Moresby'),
  (108, 'Australia/Sydney', '(GMT+10:00) Sydney'),
  (109, 'Asia/Vladivostok', '(GMT+11:00) Vladivostok'),
  (110, 'Asia/Magadan', '(GMT+12:00) Magadan'),
  (111, 'Pacific/Auckland', '(GMT+12:00) Auckland'),
  (112, 'Pacific/Fiji', '(GMT+12:00) Fiji');



INSERT INTO `CurrencyTypes`(`id`, `code`, `name`) VALUES
  (3, 'AED', 'Utd. Arab Emir. Dirham'),
  (4, 'AFN', 'Afghanistan Afghani'),
  (5, 'ALL', 'Albanian Lek'),
  (6, 'ANG', 'NL Antillian Guilder'),
  (7, 'AOR', 'Angolan New Kwanza'),
  (177, 'ARP', 'Argentina Pesos'),
  (8, 'ARS', 'Argentine Peso'),
  (10, 'AUD', 'Australian Dollar'),
  (11, 'AWG', 'Aruban Florin'),
  (12, 'BBD', 'Barbados Dollar'),
  (13, 'BDT', 'Bangladeshi Taka'),
  (15, 'BGL', 'Bulgarian Lev'),
  (16, 'BHD', 'Bahraini Dinar'),
  (17, 'BIF', 'Burundi Franc'),
  (18, 'BMD', 'Bermudian Dollar'),
  (19, 'BND', 'Brunei Dollar'),
  (20, 'BOB', 'Bolivian Boliviano'),
  (21, 'BRL', 'Brazilian Real'),
  (22, 'BSD', 'Bahamian Dollar'),
  (23, 'BTN', 'Bhutan Ngultrum'),
  (24, 'BWP', 'Botswana Pula'),
  (25, 'BZD', 'Belize Dollar'),
  (26, 'CAD', 'Canadian Dollar'),
  (27, 'CHF', 'Swiss Franc'),
  (28, 'CLP', 'Chilean Peso'),
  (29, 'CNY', 'Chinese Yuan Renminbi'),
  (30, 'COP', 'Colombian Peso'),
  (31, 'CRC', 'Costa Rican Colon'),
  (171, 'CZK', 'Czech Koruna'),
  (32, 'CUP', 'Cuban Peso'),
  (33, 'CVE', 'Cape Verde Escudo'),
  (34, 'CYP', 'Cyprus Pound'),
  (37, 'DJF', 'Djibouti Franc'),
  (38, 'DKK', 'Danish Krona'),
  (39, 'DOP', 'Dominican Peso'),
  (40, 'DZD', 'Algerian Dinar'),
  (41, 'ECS', 'Ecuador Sucre'),
  (43, 'EEK', 'Estonian Krona'),
  (44, 'EGP', 'Egyptian Pound'),
  (46, 'ETB', 'Ethiopian Birr'),
  (42, 'EUR', 'Euro'),
  (48, 'FJD', 'Fiji Dollar'),
  (49, 'FKP', 'Falkland Islands Pound'),
  (51, 'GBP', 'Pound Sterling'),
  (52, 'GHC', 'Ghanaian Cedi'),
  (53, 'GIP', 'Gibraltar Pound'),
  (54, 'GMD', 'Gambian Dalasi'),
  (55, 'GNF', 'Guinea Franc'),
  (57, 'GTQ', 'Guatemalan Quetzal'),
  (58, 'GYD', 'Guyanan Dollar'),
  (59, 'HKD', 'Hong Kong Dollar'),
  (60, 'HNL', 'Honduran Lempira'),
  (61, 'HRK', 'Croatian Kuna'),
  (62, 'HTG', 'Haitian Gourde'),
  (63, 'HUF', 'Hungarian Forint'),
  (64, 'IDR', 'Indonesian Rupiah'),
  (66, 'ILS', 'Israeli New Shekel'),
  (67, 'INR', 'Indian Rupee'),
  (68, 'IQD', 'Iraqi Dinar'),
  (69, 'IRR', 'Iranian Rial'),
  (70, 'ISK', 'Iceland Krona'),
  (72, 'JMD', 'Jamaican Dollar'),
  (73, 'JOD', 'Jordanian Dinar'),
  (74, 'JPY', 'Japanese Yen'),
  (75, 'KES', 'Kenyan Shilling'),
  (76, 'KHR', 'Kampuchean Riel'),
  (77, 'KMF', 'Comoros Franc'),
  (78, 'KPW', 'North Korean Won'),
  (79, 'KRW', 'Korean Won'),
  (80, 'KWD', 'Kuwaiti Dinar'),
  (81, 'KYD', 'Cayman Islands Dollar'),
  (82, 'KZT', 'Kazakhstan Tenge'),
  (83, 'LAK', 'Lao Kip'),
  (84, 'LBP', 'Lebanese Pound'),
  (85, 'LKR', 'Sri Lanka Rupee'),
  (86, 'LRD', 'Liberian Dollar'),
  (87, 'LSL', 'Lesotho Loti'),
  (88, 'LTL', 'Lithuanian Litas'),
  (90, 'LVL', 'Latvian Lats'),
  (91, 'LYD', 'Libyan Dinar'),
  (92, 'MAD', 'Moroccan Dirham'),
  (93, 'MGF', 'Malagasy Franc'),
  (94, 'MMK', 'Myanmar Kyat'),
  (95, 'MNT', 'Mongolian Tugrik'),
  (96, 'MOP', 'Macau Pataca'),
  (97, 'MRO', 'Mauritanian Ouguiya'),
  (98, 'MTL', 'Maltese Lira'),
  (99, 'MUR', 'Mauritius Rupee'),
  (100, 'MVR', 'Maldive Rufiyaa'),
  (101, 'MWK', 'Malawi Kwacha'),
  (102, 'MXN', 'Mexican New Peso'),
  (172, 'MXP', 'Mexican Peso'),
  (103, 'MYR', 'Malaysian Ringgit'),
  (104, 'MZM', 'Mozambique Metical'),
  (105, 'NAD', 'Namibia Dollar'),
  (106, 'NGN', 'Nigerian Naira'),
  (107, 'NIO', 'Nicaraguan Cordoba Oro'),
  (109, 'NOK', 'Norwegian Krona'),
  (110, 'NPR', 'Nepalese Rupee'),
  (111, 'NZD', 'New Zealand Dollar'),
  (112, 'OMR', 'Omani Rial'),
  (113, 'PAB', 'Panamanian Balboa'),
  (114, 'PEN', 'Peruvian Nuevo Sol'),
  (115, 'PGK', 'Papua New Guinea Kina'),
  (116, 'PHP', 'Philippine Peso'),
  (117, 'PKR', 'Pakistan Rupee'),
  (118, 'PLN', 'Polish Zloty'),
  (120, 'PYG', 'Paraguay Guarani'),
  (121, 'QAR', 'Qatari Rial'),
  (122, 'ROL', 'Romanian Leu'),
  (123, 'RUB', 'Russian Rouble'),
  (180, 'RUR', 'Russia Rubles'),
  (125, 'SBD', 'Solomon Islands Dollar'),
  (126, 'SCR', 'Seychelles Rupee'),
  (127, 'SDD', 'Sudanese Dinar'),
  (128, 'SDP', 'Sudanese Pound'),
  (129, 'SEK', 'Swedish Krona'),
  (131, 'SGD', 'Singapore Dollar'),
  (132, 'SHP', 'St. Helena Pound'),
  (130, 'SKK', 'Slovak Koruna'),
  (135, 'SLL', 'Sierra Leone Leone'),
  (136, 'SOS', 'Somali Shilling'),
  (137, 'SRD', 'Surinamese Dollar'),
  (138, 'STD', 'Sao Tome/Principe Dobra'),
  (139, 'SVC', 'El Salvador Colon'),
  (140, 'SYP', 'Syrian Pound'),
  (141, 'SZL', 'Swaziland Lilangeni'),
  (142, 'THB', 'Thai Baht'),
  (143, 'TND', 'Tunisian Dinar'),
  (144, 'TOP', 'Tongan Pa''anga'),
  (145, 'TRL', 'Turkish Lira'),
  (146, 'TTD', 'Trinidad/Tobago Dollar'),
  (147, 'TWD', 'Taiwan Dollar'),
  (148, 'TZS', 'Tanzanian Shilling'),
  (149, 'UAH', 'Ukraine Hryvnia'),
  (150, 'UGX', 'Uganda Shilling'),
  (151, 'USD', 'United States Dollar'),
  (152, 'UYP', 'Uruguayan Peso'),
  (153, 'VEB', 'Venezuelan Bolivar'),
  (154, 'VND', 'Vietnamese Dong'),
  (155, 'VUV', 'Vanuatu Vatu'),
  (156, 'WST', 'Samoan Tala'),
  (158, 'XAF', 'CFA Franc BEAC'),
  (159, 'XAG', 'Silver (oz.)'),
  (160, 'XAU', 'Gold (oz.)'),
  (161, 'XCD', 'Eastern Caribbean Dollars'),
  (179, 'XDR', 'IMF Special Drawing Right'),
  (162, 'XOF', 'CFA Franc BCEAO'),
  (163, 'XPD', 'Palladium (oz.)'),
  (164, 'XPF', 'CFP Franc'),
  (165, 'XPT', 'Platinum (oz.)'),
  (166, 'YER', 'Yemeni Riyal'),
  (167, 'YUM', 'Yugoslavian Dinar'),
  (175, 'YUN', 'Yugoslav Dinar'),
  (168, 'ZAR', 'South African Rand'),
  (176, 'ZMK', 'Zambian Kwacha'),
  (169, 'ZRN', 'New Zaire'),
  (170, 'ZWD', 'Zimbabwe Dollar'),
  (173, 'SAR', 'Saudi Arabia Riyal');


INSERT INTO `Country`(`code`, `namecap`, `name`, `iso3`, `numcode`) VALUES
  ('AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4),
  ('AL', 'ALBANIA', 'Albania', 'ALB', 8),
  ('DZ', 'ALGERIA', 'Algeria', 'DZA', 12),
  ('AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16),
  ('AD', 'ANDORRA', 'Andorra', 'AND', 20),
  ('AO', 'ANGOLA', 'Angola', 'AGO', 24),
  ('AI', 'ANGUILLA', 'Anguilla', 'AIA', 660),
  ('AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL),
  ('AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28),
  ('AR', 'ARGENTINA', 'Argentina', 'ARG', 32),
  ('AM', 'ARMENIA', 'Armenia', 'ARM', 51),
  ('AW', 'ARUBA', 'Aruba', 'ABW', 533),
  ('AU', 'AUSTRALIA', 'Australia', 'AUS', 36),
  ('AT', 'AUSTRIA', 'Austria', 'AUT', 40),
  ('AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31),
  ('BS', 'BAHAMAS', 'Bahamas', 'BHS', 44),
  ('BH', 'BAHRAIN', 'Bahrain', 'BHR', 48),
  ('BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50),
  ('BB', 'BARBADOS', 'Barbados', 'BRB', 52),
  ('BY', 'BELARUS', 'Belarus', 'BLR', 112),
  ('BE', 'BELGIUM', 'Belgium', 'BEL', 56),
  ('BZ', 'BELIZE', 'Belize', 'BLZ', 84),
  ('BJ', 'BENIN', 'Benin', 'BEN', 204),
  ('BM', 'BERMUDA', 'Bermuda', 'BMU', 60),
  ('BT', 'BHUTAN', 'Bhutan', 'BTN', 64),
  ('BO', 'BOLIVIA', 'Bolivia', 'BOL', 68),
  ('BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70),
  ('BW', 'BOTSWANA', 'Botswana', 'BWA', 72),
  ('BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL),
  ('BR', 'BRAZIL', 'Brazil', 'BRA', 76),
  ('IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL),
  ('BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96),
  ('BG', 'BULGARIA', 'Bulgaria', 'BGR', 100),
  ('BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854),
  ('BI', 'BURUNDI', 'Burundi', 'BDI', 108),
  ('KH', 'CAMBODIA', 'Cambodia', 'KHM', 116),
  ('CM', 'CAMEROON', 'Cameroon', 'CMR', 120),
  ('CA', 'CANADA', 'Canada', 'CAN', 124),
  ('CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132),
  ('KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136),
  ('CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140),
  ('TD', 'CHAD', 'Chad', 'TCD', 148),
  ('CL', 'CHILE', 'Chile', 'CHL', 152),
  ('CN', 'CHINA', 'China', 'CHN', 156),
  ('CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL),
  ('CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL),
  ('CO', 'COLOMBIA', 'Colombia', 'COL', 170),
  ('KM', 'COMOROS', 'Comoros', 'COM', 174),
  ('CG', 'CONGO', 'Congo', 'COG', 178),
  ('CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180),
  ('CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184),
  ('CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188),
  ('CI', 'COTE D''IVOIRE', 'Cote D''Ivoire', 'CIV', 384),
  ('HR', 'CROATIA', 'Croatia', 'HRV', 191),
  ('CU', 'CUBA', 'Cuba', 'CUB', 192),
  ('CY', 'CYPRUS', 'Cyprus', 'CYP', 196),
  ('CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203),
  ('DK', 'DENMARK', 'Denmark', 'DNK', 208),
  ('DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262),
  ('DM', 'DOMINICA', 'Dominica', 'DMA', 212),
  ('DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214),
  ('EC', 'ECUADOR', 'Ecuador', 'ECU', 218),
  ('EG', 'EGYPT', 'Egypt', 'EGY', 818),
  ('SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222),
  ('GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226),
  ('ER', 'ERITREA', 'Eritrea', 'ERI', 232),
  ('EE', 'ESTONIA', 'Estonia', 'EST', 233),
  ('ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231),
  ('FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238),
  ('FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234),
  ('FJ', 'FIJI', 'Fiji', 'FJI', 242),
  ('FI', 'FINLAND', 'Finland', 'FIN', 246),
  ('FR', 'FRANCE', 'France', 'FRA', 250),
  ('GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254),
  ('PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258),
  ('TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL),
  ('GA', 'GABON', 'Gabon', 'GAB', 266),
  ('GM', 'GAMBIA', 'Gambia', 'GMB', 270),
  ('GE', 'GEORGIA', 'Georgia', 'GEO', 268),
  ('DE', 'GERMANY', 'Germany', 'DEU', 276),
  ('GH', 'GHANA', 'Ghana', 'GHA', 288),
  ('GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292),
  ('GR', 'GREECE', 'Greece', 'GRC', 300),
  ('GL', 'GREENLAND', 'Greenland', 'GRL', 304),
  ('GD', 'GRENADA', 'Grenada', 'GRD', 308),
  ('GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312),
  ('GU', 'GUAM', 'Guam', 'GUM', 316),
  ('GT', 'GUATEMALA', 'Guatemala', 'GTM', 320),
  ('GN', 'GUINEA', 'Guinea', 'GIN', 324),
  ('GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624),
  ('GY', 'GUYANA', 'Guyana', 'GUY', 328),
  ('HT', 'HAITI', 'Haiti', 'HTI', 332),
  ('HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL),
  ('VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336),
  ('HN', 'HONDURAS', 'Honduras', 'HND', 340),
  ('HK', 'HONG KONG', 'Hong Kong', 'HKG', 344),
  ('HU', 'HUNGARY', 'Hungary', 'HUN', 348),
  ('IS', 'ICELAND', 'Iceland', 'ISL', 352),
  ('IN', 'INDIA', 'India', 'IND', 356),
  ('ID', 'INDONESIA', 'Indonesia', 'IDN', 360),
  ('IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364),
  ('IQ', 'IRAQ', 'Iraq', 'IRQ', 368),
  ('IE', 'IRELAND', 'Ireland', 'IRL', 372),
  ('IL', 'ISRAEL', 'Israel', 'ISR', 376),
  ('IT', 'ITALY', 'Italy', 'ITA', 380),
  ('JM', 'JAMAICA', 'Jamaica', 'JAM', 388),
  ('JP', 'JAPAN', 'Japan', 'JPN', 392),
  ('JO', 'JORDAN', 'Jordan', 'JOR', 400),
  ('KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398),
  ('KE', 'KENYA', 'Kenya', 'KEN', 404),
  ('KI', 'KIRIBATI', 'Kiribati', 'KIR', 296),
  ('KP', 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'Korea, Democratic People''s Republic of', 'PRK', 408),
  ('KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410),
  ('KW', 'KUWAIT', 'Kuwait', 'KWT', 414),
  ('KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417),
  ('LA', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'Lao People''s Democratic Republic', 'LAO', 418),
  ('LV', 'LATVIA', 'Latvia', 'LVA', 428),
  ('LB', 'LEBANON', 'Lebanon', 'LBN', 422),
  ('LS', 'LESOTHO', 'Lesotho', 'LSO', 426),
  ('LR', 'LIBERIA', 'Liberia', 'LBR', 430),
  ('LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434),
  ('LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438),
  ('LT', 'LITHUANIA', 'Lithuania', 'LTU', 440),
  ('LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442),
  ('MO', 'MACAO', 'Macao', 'MAC', 446),
  ('MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807),
  ('MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450),
  ('MW', 'MALAWI', 'Malawi', 'MWI', 454),
  ('MY', 'MALAYSIA', 'Malaysia', 'MYS', 458),
  ('MV', 'MALDIVES', 'Maldives', 'MDV', 462),
  ('ML', 'MALI', 'Mali', 'MLI', 466),
  ('MT', 'MALTA', 'Malta', 'MLT', 470),
  ('MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584),
  ('MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474),
  ('MR', 'MAURITANIA', 'Mauritania', 'MRT', 478),
  ('MU', 'MAURITIUS', 'Mauritius', 'MUS', 480),
  ('YT', 'MAYOTTE', 'Mayotte', NULL, NULL),
  ('MX', 'MEXICO', 'Mexico', 'MEX', 484),
  ('FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583),
  ('MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498),
  ('MC', 'MONACO', 'Monaco', 'MCO', 492),
  ('MN', 'MONGOLIA', 'Mongolia', 'MNG', 496),
  ('MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500),
  ('MA', 'MOROCCO', 'Morocco', 'MAR', 504),
  ('MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508),
  ('MM', 'MYANMAR', 'Myanmar', 'MMR', 104),
  ('NA', 'NAMIBIA', 'Namibia', 'NAM', 516),
  ('NR', 'NAURU', 'Nauru', 'NRU', 520),
  ('NP', 'NEPAL', 'Nepal', 'NPL', 524),
  ('NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528),
  ('AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530),
  ('NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540),
  ('NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554),
  ('NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558),
  ('NE', 'NIGER', 'Niger', 'NER', 562),
  ('NG', 'NIGERIA', 'Nigeria', 'NGA', 566),
  ('NU', 'NIUE', 'Niue', 'NIU', 570),
  ('NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574),
  ('MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580),
  ('NO', 'NORWAY', 'Norway', 'NOR', 578),
  ('OM', 'OMAN', 'Oman', 'OMN', 512),
  ('PK', 'PAKISTAN', 'Pakistan', 'PAK', 586),
  ('PW', 'PALAU', 'Palau', 'PLW', 585),
  ('PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL),
  ('PA', 'PANAMA', 'Panama', 'PAN', 591),
  ('PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598),
  ('PY', 'PARAGUAY', 'Paraguay', 'PRY', 600),
  ('PE', 'PERU', 'Peru', 'PER', 604),
  ('PH', 'PHILIPPINES', 'Philippines', 'PHL', 608),
  ('PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612),
  ('PL', 'POLAND', 'Poland', 'POL', 616),
  ('PT', 'PORTUGAL', 'Portugal', 'PRT', 620),
  ('PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630),
  ('QA', 'QATAR', 'Qatar', 'QAT', 634),
  ('RE', 'REUNION', 'Reunion', 'REU', 638),
  ('RO', 'ROMANIA', 'Romania', 'ROM', 642),
  ('RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643),
  ('RW', 'RWANDA', 'Rwanda', 'RWA', 646),
  ('SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654),
  ('KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659),
  ('LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662),
  ('PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666),
  ('VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670),
  ('WS', 'SAMOA', 'Samoa', 'WSM', 882),
  ('SM', 'SAN MARINO', 'San Marino', 'SMR', 674),
  ('ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678),
  ('SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682),
  ('SN', 'SENEGAL', 'Senegal', 'SEN', 686),
  ('CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL),
  ('SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690),
  ('SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694),
  ('SG', 'SINGAPORE', 'Singapore', 'SGP', 702),
  ('SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703),
  ('SI', 'SLOVENIA', 'Slovenia', 'SVN', 705),
  ('SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90),
  ('SO', 'SOMALIA', 'Somalia', 'SOM', 706),
  ('ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710),
  ('GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL),
  ('ES', 'SPAIN', 'Spain', 'ESP', 724),
  ('LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144),
  ('SD', 'SUDAN', 'Sudan', 'SDN', 736),
  ('SR', 'SURINAME', 'Suriname', 'SUR', 740),
  ('SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744),
  ('SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748),
  ('SE', 'SWEDEN', 'Sweden', 'SWE', 752),
  ('CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756),
  ('SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760),
  ('TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan', 'TWN', 158),
  ('TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762),
  ('TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834),
  ('TH', 'THAILAND', 'Thailand', 'THA', 764),
  ('TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL),
  ('TG', 'TOGO', 'Togo', 'TGO', 768),
  ('TK', 'TOKELAU', 'Tokelau', 'TKL', 772),
  ('TO', 'TONGA', 'Tonga', 'TON', 776),
  ('TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780),
  ('TN', 'TUNISIA', 'Tunisia', 'TUN', 788),
  ('TR', 'TURKEY', 'Turkey', 'TUR', 792),
  ('TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795),
  ('TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796),
  ('TV', 'TUVALU', 'Tuvalu', 'TUV', 798),
  ('UG', 'UGANDA', 'Uganda', 'UGA', 800),
  ('UA', 'UKRAINE', 'Ukraine', 'UKR', 804),
  ('AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784),
  ('GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826),
  ('US', 'UNITED STATES', 'United States', 'USA', 840),
  ('UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL),
  ('UY', 'URUGUAY', 'Uruguay', 'URY', 858),
  ('UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860),
  ('VU', 'VANUATU', 'Vanuatu', 'VUT', 548),
  ('VE', 'VENEZUELA', 'Venezuela', 'VEN', 862),
  ('VN', 'VIET NAM', 'Viet Nam', 'VNM', 704),
  ('VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92),
  ('VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850),
  ('WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876),
  ('EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732),
  ('YE', 'YEMEN', 'Yemen', 'YEM', 887),
  ('ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894),
  ('ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716);

INSERT INTO `Province`(`id`, `name`, `code`, `country`) VALUES
  (1, 'Alaska', 'AK', 'US'),
  (2, 'Alabama', 'AL', 'US'),
  (3, 'American Samoa', 'AS', 'US'),
  (4, 'Arizona', 'AZ', 'US'),
  (5, 'Arkansas', 'AR', 'US'),
  (6, 'California', 'CA', 'US'),
  (7, 'Colorado', 'CO', 'US'),
  (8, 'Connecticut', 'CT', 'US'),
  (9, 'Delaware', 'DE', 'US'),
  (10, 'District of Columbia', 'DC', 'US'),
  (11, 'Federated States of Micronesia', 'FM', 'US'),
  (12, 'Florida', 'FL', 'US'),
  (13, 'Georgia', 'GA', 'US'),
  (14, 'Guam', 'GU', 'US'),
  (15, 'Hawaii', 'HI', 'US'),
  (16, 'Idaho', 'ID', 'US'),
  (17, 'Illinois', 'IL', 'US'),
  (18, 'Indiana', 'IN', 'US'),
  (19, 'Iowa', 'IA', 'US'),
  (20, 'Kansas', 'KS', 'US'),
  (21, 'Kentucky', 'KY', 'US'),
  (22, 'Louisiana', 'LA', 'US'),
  (23, 'Maine', 'ME', 'US'),
  (24, 'Marshall Islands', 'MH', 'US'),
  (25, 'Maryland', 'MD', 'US'),
  (26, 'Massachusetts', 'MA', 'US'),
  (27, 'Michigan', 'MI', 'US'),
  (28, 'Minnesota', 'MN', 'US'),
  (29, 'Mississippi', 'MS', 'US'),
  (30, 'Missouri', 'MO', 'US'),
  (31, 'Montana', 'MT', 'US'),
  (32, 'Nebraska', 'NE', 'US'),
  (33, 'Nevada', 'NV', 'US'),
  (34, 'New Hampshire', 'NH', 'US'),
  (35, 'New Jersey', 'NJ', 'US'),
  (36, 'New Mexico', 'NM', 'US'),
  (37, 'New York', 'NY', 'US'),
  (38, 'North Carolina', 'NC', 'US'),
  (39, 'North Dakota', 'ND', 'US'),
  (40, 'Northern Mariana Islands', 'MP', 'US'),
  (41, 'Ohio', 'OH', 'US'),
  (42, 'Oklahoma', 'OK', 'US'),
  (43, 'Oregon', 'OR', 'US'),
  (44, 'Palau', 'PW', 'US'),
  (45, 'Pennsylvania', 'PA', 'US'),
  (46, 'Puerto Rico', 'PR', 'US'),
  (47, 'Rhode Island', 'RI', 'US'),
  (48, 'South Carolina', 'SC', 'US'),
  (49, 'South Dakota', 'SD', 'US'),
  (50, 'Tennessee', 'TN', 'US'),
  (51, 'Texas', 'TX', 'US'),
  (52, 'Utah', 'UT', 'US'),
  (53, 'Vermont', 'VT', 'US'),
  (54, 'Virgin Islands', 'VI', 'US'),
  (55, 'Virginia', 'VA', 'US'),
  (56, 'Washington', 'WA', 'US'),
  (57, 'West Virginia', 'WV', 'US'),
  (58, 'Wisconsin', 'WI', 'US'),
  (59, 'Wyoming', 'WY', 'US'),
  (60, 'Armed Forces Africa', 'AE', 'US'),
  (61, 'Armed Forces Americas (except Canada)', 'AA', 'US'),
  (62, 'Armed Forces Canada', 'AE', 'US'),
  (63, 'Armed Forces Europe', 'AE', 'US'),
  (64, 'Armed Forces Middle East', 'AE', 'US'),
  (65, 'Armed Forces Pacific', 'AP', 'US');



INSERT INTO `Nationality` (`id`, `name`) VALUES
  (1, 'Afghan'),
  (2, 'Albanian'),
  (3, 'Algerian'),
  (4, 'American'),
  (5, 'Andorran'),
  (6, 'Angolan'),
  (7, 'Antiguans'),
  (8, 'Argentinean'),
  (9, 'Armenian'),
  (10, 'Australian'),
  (11, 'Austrian'),
  (12, 'Azerbaijani'),
  (13, 'Bahamian'),
  (14, 'Bahraini'),
  (15, 'Bangladeshi'),
  (16, 'Barbadian'),
  (17, 'Barbudans'),
  (18, 'Batswana'),
  (19, 'Belarusian'),
  (20, 'Belgian'),
  (21, 'Belizean'),
  (22, 'Beninese'),
  (23, 'Bhutanese'),
  (24, 'Bolivian'),
  (25, 'Bosnian'),
  (26, 'Brazilian'),
  (27, 'British'),
  (28, 'Bruneian'),
  (29, 'Bulgarian'),
  (30, 'Burkinabe'),
  (31, 'Burmese'),
  (32, 'Burundian'),
  (33, 'Cambodian'),
  (34, 'Cameroonian'),
  (35, 'Canadian'),
  (36, 'Cape Verdean'),
  (37, 'Central African'),
  (38, 'Chadian'),
  (39, 'Chilean'),
  (40, 'Chinese'),
  (41, 'Colombian'),
  (42, 'Comoran'),
  (43, 'Congolese'),
  (44, 'Costa Rican'),
  (45, 'Croatian'),
  (46, 'Cuban'),
  (47, 'Cypriot'),
  (48, 'Czech'),
  (49, 'Danish'),
  (50, 'Djibouti'),
  (51, 'Dominican'),
  (52, 'Dutch'),
  (53, 'East Timorese'),
  (54, 'Ecuadorean'),
  (55, 'Egyptian'),
  (56, 'Emirian'),
  (57, 'Equatorial Guinean'),
  (58, 'Eritrean'),
  (59, 'Estonian'),
  (60, 'Ethiopian'),
  (61, 'Fijian'),
  (62, 'Filipino'),
  (63, 'Finnish'),
  (64, 'French'),
  (65, 'Gabonese'),
  (66, 'Gambian'),
  (67, 'Georgian'),
  (68, 'German'),
  (69, 'Ghanaian'),
  (70, 'Greek'),
  (71, 'Grenadian'),
  (72, 'Guatemalan'),
  (73, 'Guinea-Bissauan'),
  (74, 'Guinean'),
  (75, 'Guyanese'),
  (76, 'Haitian'),
  (77, 'Herzegovinian'),
  (78, 'Honduran'),
  (79, 'Hungarian'),
  (80, 'I-Kiribati'),
  (81, 'Icelander'),
  (82, 'Indian'),
  (83, 'Indonesian'),
  (84, 'Iranian'),
  (85, 'Iraqi'),
  (86, 'Irish'),
  (87, 'Israeli'),
  (88, 'Italian'),
  (89, 'Ivorian'),
  (90, 'Jamaican'),
  (91, 'Japanese'),
  (92, 'Jordanian'),
  (93, 'Kazakhstani'),
  (94, 'Kenyan'),
  (95, 'Kittian and Nevisian'),
  (96, 'Kuwaiti'),
  (97, 'Kyrgyz'),
  (98, 'Laotian'),
  (99, 'Latvian'),
  (100, 'Lebanese'),
  (101, 'Liberian'),
  (102, 'Libyan'),
  (103, 'Liechtensteiner'),
  (104, 'Lithuanian'),
  (105, 'Luxembourger'),
  (106, 'Macedonian'),
  (107, 'Malagasy'),
  (108, 'Malawian'),
  (109, 'Malaysian'),
  (110, 'Maldivan'),
  (111, 'Malian'),
  (112, 'Maltese'),
  (113, 'Marshallese'),
  (114, 'Mauritanian'),
  (115, 'Mauritian'),
  (116, 'Mexican'),
  (117, 'Micronesian'),
  (118, 'Moldovan'),
  (119, 'Monacan'),
  (120, 'Mongolian'),
  (121, 'Moroccan'),
  (122, 'Mosotho'),
  (123, 'Motswana'),
  (124, 'Mozambican'),
  (125, 'Namibian'),
  (126, 'Nauruan'),
  (127, 'Nepalese'),
  (128, 'New Zealander'),
  (129, 'Nicaraguan'),
  (130, 'Nigerian'),
  (131, 'Nigerien'),
  (132, 'North Korean'),
  (133, 'Northern Irish'),
  (134, 'Norwegian'),
  (135, 'Omani'),
  (136, 'Pakistani'),
  (137, 'Palauan'),
  (138, 'Panamanian'),
  (139, 'Papua New Guinean'),
  (140, 'Paraguayan'),
  (141, 'Peruvian'),
  (142, 'Polish'),
  (143, 'Portuguese'),
  (144, 'Qatari'),
  (145, 'Romanian'),
  (146, 'Russian'),
  (147, 'Rwandan'),
  (148, 'Saint Lucian'),
  (149, 'Salvadoran'),
  (150, 'Samoan'),
  (151, 'San Marinese'),
  (152, 'Sao Tomean'),
  (153, 'Saudi'),
  (154, 'Scottish'),
  (155, 'Senegalese'),
  (156, 'Serbian'),
  (157, 'Seychellois'),
  (158, 'Sierra Leonean'),
  (159, 'Singaporean'),
  (160, 'Slovakian'),
  (161, 'Slovenian'),
  (162, 'Solomon Islander'),
  (163, 'Somali'),
  (164, 'South African'),
  (165, 'South Korean'),
  (166, 'Spanish'),
  (167, 'Sri Lankan'),
  (168, 'Sudanese'),
  (169, 'Surinamer'),
  (170, 'Swazi'),
  (171, 'Swedish'),
  (172, 'Swiss'),
  (173, 'Syrian'),
  (174, 'Taiwanese'),
  (175, 'Tajik'),
  (176, 'Tanzanian'),
  (177, 'Thai'),
  (178, 'Togolese'),
  (179, 'Tongan'),
  (180, 'Trinidadian or Tobagonian'),
  (181, 'Tunisian'),
  (182, 'Turkish'),
  (183, 'Tuvaluan'),
  (184, 'Ugandan'),
  (185, 'Ukrainian'),
  (186, 'Uruguayan'),
  (187, 'Uzbekistani'),
  (188, 'Venezuelan'),
  (189, 'Vietnamese'),
  (190, 'Welsh'),
  (191, 'Yemenite'),
  (192, 'Zambian'),
  (193, 'Zimbabwean');

INSERT INTO `WorkDays` (`id`, `name`, `status`, `country`) VALUES
  (1, 'Monday', 'Full Day',NULL),
  (2, 'Tuesday', 'Full Day',NULL),
  (3, 'Wednesday', 'Full Day',NULL),
  (4, 'Thursday', 'Full Day',NULL),
  (5, 'Friday', 'Full Day',NULL),
  (6, 'Saturday', 'Non-working Day',NULL),
  (7, 'Sunday', 'Non-working Day',NULL);


REPLACE INTO `Reports` (`name`, `details`, `parameters`, `query`, `paramOrder`, `type`,`report_group`,`output`) VALUES
  ('Employee Details Report', 'This report list all employee details and you can filter employees by department, employment status or job title', '[\r\n[ "department", {"label":"Department","type":"select2","remote-source":["CompanyStructure","id","title"],"allow-null":true}],\r\n[ "employment_status", {"label":"Employment Status","type":"select2","remote-source":["EmploymentStatus","id","name"],"allow-null":true}],\r\n[ "job_title", {"label":"Job Title","type":"select2","remote-source":["JobTitle","id","name"],"allow-null":true}]\r\n]', 'Select id, employee_id as ''Employee ID'',\r\nconcat(`first_name`,'' '',`middle_name`,'' '', `last_name`) as ''Name'',\r\n(SELECT name from Nationality where id = nationality) as ''Nationality'',\r\nbirthday as ''Birthday'',\r\ngender as ''Gender'',\r\nmarital_status as ''Marital Status'',\r\nssn_num as ''SSN Number'',\r\nnic_num as ''NIC Number'',\r\nother_id as ''Other IDs'',\r\ndriving_license as ''Driving License Number'',\r\n(SELECT name from EmploymentStatus where id = employment_status) as ''Employment Status'',\r\n(SELECT name from JobTitles where id = job_title) as ''Job Title'',\r\n(SELECT name from PayGrades where id = pay_grade) as ''Pay Grade'',\r\nwork_station_id as ''Work Station ID'',\r\naddress1 as ''Address 1'',\r\naddress2 as ''Address 2'',\r\ncity as ''City'',\r\n(SELECT name from Country where code = country) as ''Country'',\r\n(SELECT name from Province where id = province) as ''Province'',\r\npostal_code as ''Postal Code'',\r\nhome_phone as ''Home Phone'',\r\nmobile_phone as ''Mobile Phone'',\r\nwork_phone as ''Work Phone'',\r\nwork_email as ''Work Email'',\r\nprivate_email as ''Private Email'',\r\njoined_date as ''Joined Date'',\r\nconfirmation_date as ''Confirmation Date'',\r\n(SELECT title from CompanyStructures where id = department) as ''Department'',\r\n(SELECT concat(`first_name`,'' '',`middle_name`,'' '', `last_name`,'' [Employee ID:'',`employee_id`,'']'') from Employees e1 where e1.id = e.supervisor) as ''Supervisor'' \r\nFROM Employees e _where_', '["department","employment_status","job_title"]', 'Query', 'Employee Information','CSV'),
  ('Employee Attendance Report', 'This report list all employee attendance entries by employee and date range', '[\r\n[ "employee", {"label":"Employee","type":"select2multi","allow-null":true,"null-label":"All Employees","remote-source":["Employee","id","first_name+last_name"]}],\r\n[ "date_start", {"label":"Start Date","type":"date"}],\r\n[ "date_end", {"label":"End Date","type":"date"}]\r\n]', 'EmployeeAttendanceReport', '["employee","date_start","date_end"]', 'Class','Time Management','CSV'),
  ('Employee Time Tracking Report', 'This report list employee working hours and attendance details for each day for a given period ', '[\r\n[ "employee", {"label":"Employee","type":"select2","allow-null":false,"remote-source":["Employee","id","first_name+last_name"]}],\r\n[ "date_start", {"label":"Start Date","type":"date"}],\r\n[ "date_end", {"label":"End Date","type":"date"}]\r\n]', 'EmployeeTimeTrackReport', '["employee","date_start","date_end"]', 'Class','Time Management','CSV');


REPLACE INTO `Reports` (`name`, `details`, `parameters`, `query`, `paramOrder`, `type`,`report_group`,`output`) VALUES
  ('Employee Time Entry Report', 'View employee time entries by date range and project',
   '[\r\n[ "employee", {"label":"Employee","type":"select2multi","allow-null":true,"null-label":"All Employees","remote-source":["Employee","id","first_name+last_name"]}],\r\n[ "client", {"label":"Select Client","type":"select","allow-null":true,"null-label":"Not Selected","remote-source":["Client","id","name"]}],\r\n[ "project", {"label":"Or Project","type":"select","allow-null":true,"null-label":"All Projects","remote-source":["Project","id","name","getAllProjects"]}],\r\n[ "date_start", {"label":"Start Date","type":"date"}],\r\n[ "date_end", {"label":"End Date","type":"date"}]\r\n]',
   'EmployeeTimesheetReport', '["employee","client","project","date_start","date_end","status"]', 'Class','Time Management','CSV');


REPLACE INTO `Reports` (`name`, `details`, `parameters`, `query`, `paramOrder`, `type`,`report_group`,`output`) VALUES
  ('Active Employee Report', 'This report list employees who are currently active based on joined date and termination date ',
   '[\r\n[ "department", {"label":"Department","type":"select2","remote-source":["CompanyStructure","id","title"],"allow-null":true}]\r\n]',
   'ActiveEmployeeReport',
   '["department"]', 'Class','Employee Information','CSV');

REPLACE INTO `Reports` (`name`, `details`, `parameters`, `query`, `paramOrder`, `type`, `report_group`,`output`) VALUES
  ('New Hires Employee Report', 'This report list employees who are joined between given two dates ',
   '[[ "department", {"label":"Department","type":"select2","remote-source":["CompanyStructure","id","title"],"allow-null":true}],\r\n[ "date_start", {"label":"Start Date","type":"date"}],\r\n[ "date_end", {"label":"End Date","type":"date"}]\r\n]',
   'NewHiresEmployeeReport',
   '["department","date_start","date_end"]', 'Class','Employee Information','CSV');

REPLACE INTO `Reports` (`name`, `details`, `parameters`, `query`, `paramOrder`, `type`, `report_group`,`output`) VALUES
  ('Terminated Employee Report', 'This report list employees who are terminated between given two dates ',
   '[[ "department", {"label":"Department","type":"select2","remote-source":["CompanyStructure","id","title"],"allow-null":true}],\r\n[ "date_start", {"label":"Start Date","type":"date"}],\r\n[ "date_end", {"label":"End Date","type":"date"}]\r\n]',
   'TerminatedEmployeeReport',
   '["department","date_start","date_end"]', 'Class','Employee Information','CSV');

REPLACE INTO `Reports` (`name`, `details`, `parameters`, `query`, `paramOrder`, `type`,`report_group`,`output`) VALUES
  ('Travel Request Report', 'This report list employees travel requests for a specified period',
   '[\r\n[ "employee", {"label":"Employee","type":"select2multi","allow-null":true,"null-label":"All Employees","remote-source":["Employee","id","first_name+last_name"]}],\r\n[ "date_start", {"label":"Start Date","type":"date"}],\r\n[ "date_end", {"label":"End Date","type":"date"}],\r\n[ "status", {"label":"Status","type":"select","source":[["NULL","All Statuses"],["Approved","Approved"],["Pending","Pending"],["Rejected","Rejected"],["Cancellation Requested","Cancellation Requested"],["Cancelled","Cancelled"]]}]\r\n]',
   'TravelRequestReport',
   '["employee","date_start","date_end","status"]', 'Class', 'Travel and Expense Management','CSV');


REPLACE INTO `Reports` (`name`, `details`, `parameters`, `query`, `paramOrder`, `type`,`report_group`,`output`) VALUES
  ('Employee Time Sheet Report', 'This report list all employee time sheets by employee and date range', '[\r\n[ "employee", {"label":"Employee","type":"select2multi","allow-null":true,"null-label":"All Employees","remote-source":["Employee","id","first_name+last_name"]}],\r\n[ "date_start", {"label":"Start Date","type":"date"}],\r\n[ "date_end", {"label":"End Date","type":"date"}],\r\n[ "status", {"label":"Status","allow-null":true,"null-label":"All Status","type":"select","source":[["Approved","Approved"],["Pending","Pending"],["Rejected","Rejected"]]}]\r\n]', 'EmployeeTimeSheetData', '["employee","date_start","date_end","status"]', 'Class','Time Management','CSV');



INSERT INTO `Settings` (`name`, `value`, `description`, `meta`) VALUES
('Company: Logo', '', '','[ "value", {"label":"Logo","type":"fileupload","validation":"none"}]'),
('Company: Name', 'Sample Company Pvt Ltd', 'Update your company name - For updating company logo copy a file named logo.png to /app/data/ folder', ''),
('Company: Description', 'This is a company using icehrm.com', '',''),
('Email: Enable', '1', '0 will disable all outgoing emails from modules. Value 1 will enable outgoing emails','["value", {"label":"Value","type":"select","source":[["1","Yes"],["0","No"]]}]'),
('Email: Mode', 'SMTP', 'SMTP, PHP Mailer or Amazon SES. SMTP = send emails using local or a remote smtp server. PHP Mailer = send emails using mail function provided by php. Amazon SES = send emails trough amazon Simple Email Service.','["value", {"label":"Value","type":"select","source":[["SMTP","SMTP"],["PHP Mailer","PHP Mailer"],["SES","Amazon SES"]]}]'),
('Email: SMTP Host', 'localhost', 'SMTP host IP',''),
('Email: SMTP Authentication Required', '0', 'Is authentication required by this SMTP server','["value", {"label":"Value","type":"select","source":[["1","Yes"],["0","No"]]}]'),
('Email: SMTP User', 'none', 'SMTP user',''),
('Email: SMTP Password', 'none', 'SMTP password',''),
('Email: SMTP Port', 'none', '25',''),
('Email: Amazon Access Key ID', '', 'If email mode is Amazon SNS please provide SNS Key',''),
('Email: Amazon Secret Access Key', '',  'If email mode is Amazon SNS please provide SNS Secret',''),
('Email: Email From', 'icehrm@mydomain.com', '',''),
('System: Do not pass JSON in request', '0', 'Select Yes if you are having trouble loading data for some tables','["value", {"label":"Value","type":"select","source":[["1","Yes"],["0","No"]]}]'),
('System: Reset Modules and Permissions', '0', 'Select this to reset module and permission information in Database (If you have done any changes to meta files)','["value", {"label":"Value","type":"select","source":[["1","Yes"],["0","No"]]}]'),
('System: Reset Module Names', '0', 'Select this to reset module names in Database','["value", {"label":"Value","type":"select","source":[["1","Yes"],["0","No"]]}]'),
('System: Add New Permissions', '0', 'Select this to add new permission changes done to meta.json file of any module','["value", {"label":"Value","type":"select","source":[["1","Yes"],["0","No"]]}]'),
('System: Debug Mode', '0', '','["value", {"label":"Value","type":"select","source":[["1","Yes"],["0","No"]]}]'),
('Projects: Make All Projects Available to Employees', '1', '','["value", {"label":"Value","type":"select","source":[["1","Yes"],["0","No"]]}]'),
('Leave: Share Calendar to Whole Company', '1', '','["value", {"label":"Value","type":"select","source":[["1","Yes"],["0","No"]]}]'),
('Leave: CC Emails', '',  'Every email sent though leave module will be CC to these comma seperated list of emails addresses',''),
('Leave: BCC Emails', '',  'Every email sent though leave module will be BCC to these comma seperated list of emails addresses',''),
('Attendance: Time-sheet Cross Check', '0',  'Only allow users to add an entry to a timesheet only if they have marked atteandance for the selected period','["value", {"label":"Value","type":"select","source":[["1","Yes"],["0","No"]]}]'),
('Api: REST Api Enabled', '1',  '','["value", {"label":"Value","type":"select","source":[["0","No"],["1","Yes"]]}]'),
('Api: REST Api Token', 'Click on edit icon',  '','["value", {"label":"Value","type":"placeholder"}]');

REPLACE INTO `Settings` (`name`, `value`, `description`, `meta`) VALUES
  ('LDAP: Enabled', '0',  '','["value", {"label":"Value","type":"select","source":[["0","No"],["1","Yes"]]}]'),
  ('LDAP: Server', '',  'LDAP Server IP or DNS',''),
  ('LDAP: Port', '389',  'LDAP Server Port',''),
  ('LDAP: Root DN', '',  'e.g: dc=mycompany,dc=net',''),
  ('LDAP: Manager DN', '',  'e.g: cn=admin,dc=mycompany,dc=net',''),
  ('LDAP: Manager Password', '',  'Password of the manager user',''),
  ('LDAP: Version 3', '1',  'Are you using LDAP v3','["value", {"label":"Value","type":"select","source":[["1","Yes"],["0","No"]]}]'),
  ('LDAP: User Filter', '',  'e.g: uid={}, we will replace {} with actual username provided by the user at the time of login','');

INSERT INTO `Settings` (`name`, `value`, `description`, `meta`) VALUES
  ('Recruitment: Show Quick Apply', '1', 'Show quick apply button when candidates are applying for jobs. Quick apply allow candidates to apply with minimum amount of information','["value", {"label":"Value","type":"select","source":[["1","Yes"],["0","No"]]}]'),
  ('Recruitment: Show Apply', '1', 'Show apply button when candidates are applying for jobs','["value", {"label":"Value","type":"select","source":[["1","Yes"],["0","No"]]}]');

INSERT INTO `Settings` (`name`, `value`, `description`, `meta`) VALUES
  ('Notifications: Send Document Expiry Emails', '1', '','["value", {"label":"Value","type":"select","source":[["1","Yes"],["0","No"]]}]'),
  ('Notifications: Copy Document Expiry Emails to Manager', '1', '','["value", {"label":"Value","type":"select","source":[["1","Yes"],["0","No"]]}]'),
  ('Expense: Pre-Approve Expenses', '0', '','["value", {"label":"Value","type":"select","source":[["1","Yes"],["0","No"]]}]'),
  ('Travel: Pre-Approve Travel Request', '0', '','["value", {"label":"Value","type":"select","source":[["1","Yes"],["0","No"]]}]');

INSERT INTO `Settings` (`name`, `value`, `description`, `meta`) VALUES
  ('Attendance: Use Department Time Zone', '0', '','["value", {"label":"Value","type":"select","source":[["1","Yes"],["0","No"]]}]');

INSERT INTO `Settings` (`name`, `value`, `description`, `meta`) VALUES
    ('Travel: Allow Indirect Admins to Approve', '0', 'Allow indirect admins to approve travel requests','["value", {"label":"Value","type":"select","source":[["1","Yes"],["0","No"]]}]');


INSERT INTO `Settings` (`name`, `value`, `description`, `meta`) VALUES
  ('Attendance: Overtime Calculation Class', 'BasicOvertimeCalculator', 'Set the method used to calculate overtime','["value", {"label":"Value","type":"select","source":[["BasicOvertimeCalculator","BasicOvertimeCalculator"],["CaliforniaOvertimeCalculator","CaliforniaOvertimeCalculator"]]}]');

REPLACE INTO `Settings` (`name`, `value`, `description`, `meta`) VALUES
  ('Attendance: Overtime Calculation Period', 'Daily', 'Set the period for overtime calculation. (Affects attendance sheets)','["value", {"label":"Value","type":"select","source":[["Daily","Daily"],["Weekly","Weekly"]]}]');


REPLACE INTO `Settings` (`name`, `value`, `description`, `meta`) VALUES
  ('Attendance: Overtime Start Hour', '8', 'Overtime calculation will start after an employee work this number of hours per day, 0 to indicate no overtime', ''),
  ('Attendance: Double time Start Hour', '12', 'Double time calculation will start after an employee work this number of hours per day, 0 to indicate no double time', '');

REPLACE INTO `Settings` (`name`, `value`, `description`, `meta`) VALUES
  ('Attendance: Work Week Start Day', '0', 'Set the starting day of the work week','["value", {"label":"Value","type":"select","source":[["0","Sunday"],["1","Monday"],["2","Tuesday"],["3","Wednesday"],["4","Thursday"],["5","Friday"],["6","Saturday"]]}]');

REPLACE INTO `Settings` (`name`, `value`, `description`, `meta`) VALUES
    ('System: Allowed Countries', '', 'Only these countries will be allowed in select boxes','["value", {"label":"Value","type":"select2multi","remote-source":["Country","id","name"]}]');

REPLACE INTO `Settings` (`name`, `value`, `description`, `meta`) VALUES
    ('System: Allowed Currencies', '', 'Only these currencies will be allowed in select boxes','["value", {"label":"Value","type":"select2multi","remote-source":["CurrencyType","id","code+name"]}]');

REPLACE INTO `Settings` (`name`, `value`, `description`, `meta`) VALUES
    ('System: Allowed Nationality', '', 'Only these nationalities will be allowed in select boxes','["value", {"label":"Value","type":"select2multi","remote-source":["Nationality","id","name"]}]');

REPLACE INTO `Settings` (`name`, `value`, `description`, `meta`) VALUES
    ('System: Language', 'en', 'Current Language','["value", {"label":"Value","type":"select2","allow-null":false,"remote-source":["SupportedLanguage","name","description"]}]');


INSERT INTO `Certifications` (`id`, `name`, `description`) VALUES
  (1, 'Red Hat Certified Architect (RHCA)', 'Red Hat Certified Architect (RHCA)'),
  (2, 'GIAC Secure Software Programmer -Java', 'GIAC Secure Software Programmer -Java'),
  (3, 'Risk Management Professional (PMI)', 'Risk Management Professional (PMI)'),
  (4, 'IT Infrastructure Library (ITIL) Expert Certification', 'IT Infrastructure Library (ITIL) Expert Certification'),
  (5, 'Microsoft Certified Architect', 'Microsoft Certified Architect'),
  (6, 'Oracle Exadata 11g Certified Implementation Specialist', 'Oracle Exadata 11g Certified Implementation Specialist'),
  (7, 'Cisco Certified Design Professional (CCDP)', 'Cisco Certified Design Professional (CCDP)'),
  (8, 'Cisco Certified Internetwork Expert (CCIE)', 'Cisco Certified Internetwork Expert (CCIE)'),
  (9, 'Cisco Certified Network Associate', 'Cisco Certified Network Associate'),
  (10, 'HP/Master Accredited Solutions Expert (MASE)', 'HP/Master Accredited Solutions Expert (MASE)'),
  (11, 'HP/Master Accredited Systems Engineer (Master ASE)', 'HP/Master Accredited Systems Engineer (Master ASE)'),
  (12, 'Certified Information Security Manager (CISM)', 'Certified Information Security Manager (CISM)'),
  (13, 'Certified Information Systems Auditor (CISA)', 'Certified Information Systems Auditor (CISA)'),
  (14, 'CyberSecurity Forensic Analyst (CSFA)', 'CyberSecurity Forensic Analyst (CSFA)'),
  (15, 'Open Group Certified Architect (OpenCA)', 'Open Group Certified Architect (OpenCA)'),
  (16, 'Oracle DBA Administrator Certified Master OCM', 'Oracle DBA Administrator Certified Master OCM'),
  (17, 'Project Management Professional', 'Project Management Professional'),
  (18, 'Apple Certified Support Professional', 'Apple Certified Support Professional'),
  (19, 'Certified Public Accountant (CPA)', 'Certified Public Accountant (CPA)'),
  (20, 'Chartered Financial Analyst', 'Chartered Financial Analyst'),
  (21, 'Professional in Human Resources (PHR)', 'Professional in Human Resources (PHR)');



INSERT INTO `Clients` (`id`, `name`, `details`, `first_contact_date`, `created`, `address`, `contact_number`, `contact_email`, `company_url`, `status`) VALUES
  (1, 'IceHrm Sample Client 1', NULL, '2012-01-04', '2013-01-03 05:47:33', '001, Sample Road,\nSample City, USA', '678-894-1047', 'icehrm+client1@web-stalk.com', 'http://icehrm.com', 'Active'),
  (2, 'IceHrm Sample Client 2', NULL, '2012-01-04', '2013-01-03 05:47:33', '001, Sample Road,\nSample City, USA', '678-894-1047', 'icehrm+client1@web-stalk.com', 'http://icehrm.com', 'Active'),
  (3, 'IceHrm Sample Client 3', NULL, '2012-01-04', '2013-01-03 05:47:33', '001, Sample Road,\nSample City, USA', '678-894-1047', 'icehrm+client1@web-stalk.com', 'http://icehrm.com', 'Active');


INSERT INTO `CompanyLoans` (`id`, `name`, `details`) VALUES
  (1, 'Personal loan', 'Personal loans'),
  (2, 'Educational loan', 'Educational loan');


INSERT INTO `CompanyStructures` (`id`, `title`, `description`, `address`, `type`, `country`, `parent`) VALUES
  (1, 'Your Company', 'Please update your company name here. You can update, delete or add units according to your needs', '', 'Company', 'US', NULL),
  (2, 'Head Office', 'US Head office', 'PO Box 001002\nSample Road, Sample Town', 'Head Office', 'US', 1),
  (3, 'Marketing Department', 'Marketing Department', 'PO Box 001002\nSample Road, Sample Town', 'Department', 'US', 2);


INSERT INTO `Documents` (`id`, `name`, `details`, `expire_notification`, `expire_notification_month`, `expire_notification_week`, `expire_notification_day`,`sign`,`created`, `updated`) VALUES
  (1, 'ID Copy', 'Your ID copy','Yes','Yes','Yes','Yes','No',NOW(), NOW()),
  (2, 'Degree Certificate', 'Degree Certificate','Yes','Yes','Yes','Yes','Yes',NOW(), NOW()),
  (3, 'Driving License', 'Driving License','Yes','Yes','Yes','Yes','Yes',NOW(), NOW());



INSERT INTO `Educations` (`id`, `name`, `description`) VALUES
  (1, 'Bachelors Degree', 'Bachelors Degree'),
  (2, 'Diploma', 'Diploma'),
  (3, 'Masters Degree', 'Masters Degree'),
  (4, 'Doctorate', 'Doctorate');

INSERT INTO `HoliDays` (`id`, `name`, `dateh`, `status`) VALUES
  (1, 'New Year''s Day', '2015-01-01', 'Full Day'),
  (2, 'Christmas Day', '2015-12-25', 'Full Day');


INSERT INTO `JobTitles` (`id`, `code`, `name`, `description`, `specification`) VALUES
  (1, 'SE', 'Software Engineer', 'The work of a software engineer typically includes designing and programming system-level software: operating systems, database systems, embedded systems and so on. They understand how both software a', 'Software Engineer'),
  (2, 'ASE', 'Assistant Software Engineer', 'Assistant Software Engineer', 'Assistant Software Engineer'),
  (3, 'PM', 'Project Manager', 'Project Manager', 'Project Manager'),
  (4, 'QAE', 'QA Engineer', 'Quality Assurance Engineer ', 'Quality Assurance Engineer '),
  (5, 'PRM', 'Product Manager', 'Product Manager', 'Product Manager'),
  (6, 'AQAE', 'Assistant QA Engineer ', 'Assistant QA Engineer ', 'Assistant QA Engineer '),
  (7, 'TPM', 'Technical Project Manager', 'Technical Project Manager', 'Technical Project Manager'),
  (8, 'PRS', 'Pre-Sales Executive', 'Pre-Sales Executive', 'Pre-Sales Executive'),
  (9, 'ME', 'Marketing Executive', 'Marketing Executive', 'Marketing Executive'),
  (10, 'DH', 'Department Head', 'Department Head', 'Department Head'),
  (11, 'CEO', 'Chief Executive Officer', 'Chief Executive Officer', 'Chief Executive Officer'),
  (12, 'DBE', 'Database Engineer', 'Database Engineer', 'Database Engineer'),
  (13, 'SA', 'Server Admin', 'Server Admin', 'Server Admin');


INSERT INTO `Languages` (`id`, `name`, `description`) VALUES
    (1, 'en', 'English'),
    (2, 'fr', 'French'),
    (3, 'de', 'German'),
    (4, 'zh', 'Chinese'),
    (5, 'aa', 'Afar'),
    (6, 'ab', 'Abkhaz'),
    (7, 'ae', 'Avestan'),
    (8, 'af', 'Afrikaans'),
    (9, 'ak', 'Akan'),
    (10, 'am', 'Amharic'),
    (11, 'an', 'Aragonese'),
    (12, 'ar', 'Arabic'),
    (13, 'as', 'Assamese'),
    (14, 'av', 'Avaric'),
    (15, 'ay', 'Aymara'),
    (16, 'az', 'Azerbaijani'),
    (17, 'ba', 'Bashkir'),
    (18, 'be', 'Belarusian'),
    (19, 'bg', 'Bulgarian'),
    (20, 'bh', 'Bihari'),
    (21, 'bi', 'Bislama'),
    (22, 'bm', 'Bambara'),
    (23, 'bn', 'Bengali'),
    (24, 'bo', 'Tibetan Standard, Tibetan, Central'),
    (25, 'br', 'Breton'),
    (26, 'bs', 'Bosnian'),
    (27, 'ca', 'Catalan; Valencian'),
    (28, 'ce', 'Chechen'),
    (29, 'ch', 'Chamorro'),
    (30, 'co', 'Corsican'),
    (31, 'cr', 'Cree'),
    (32, 'cs', 'Czech'),
    (33, 'cu', 'Old Church Slavonic, Church Slavic, Church Slavonic, Old Bulgarian, Old Slavonic'),
    (34, 'cv', 'Chuvash'),
    (35, 'cy', 'Welsh'),
    (36, 'da', 'Danish'),
    (37, 'dv', 'Divehi; Dhivehi; Maldivian;'),
    (38, 'dz', 'Dzongkha'),
    (39, 'ee', 'Ewe'),
    (40, 'el', 'Greek, Modern'),
    (41, 'eo', 'Esperanto'),
    (42, 'es', 'Spanish; Castilian'),
    (43, 'et', 'Estonian'),
    (44, 'eu', 'Basque'),
    (45, 'fa', 'Persian'),
    (46, 'ff', 'Fula; Fulah; Pulaar; Pular'),
    (47, 'fi', 'Finnish'),
    (48, 'fj', 'Fijian'),
    (49, 'fo', 'Faroese'),
    (50, 'fy', 'Western Frisian'),
    (51, 'ga', 'Irish'),
    (52, 'gd', 'Scottish Gaelic; Gaelic'),
    (53, 'gl', 'Galician'),
    (54, 'gn', 'GuaranÃ­'),
    (55, 'gu', 'Gujarati'),
    (56, 'gv', 'Manx'),
    (57, 'ha', 'Hausa'),
    (58, 'he', 'Hebrew (modern)'),
    (59, 'hi', 'Hindi'),
    (60, 'ho', 'Hiri Motu'),
    (61, 'hr', 'Croatian'),
    (62, 'ht', 'Haitian; Haitian Creole'),
    (63, 'hu', 'Hungarian'),
    (64, 'hy', 'Armenian'),
    (65, 'hz', 'Herero'),
    (66, 'ia', 'Interlingua'),
    (67, 'id', 'Indonesian'),
    (68, 'ie', 'Interlingue'),
    (69, 'ig', 'Igbo'),
    (70, 'ii', 'Nuosu'),
    (71, 'ik', 'Inupiaq'),
    (72, 'io', 'Ido'),
    (73, 'is', 'Icelandic'),
    (74, 'it', 'Italian'),
    (75, 'iu', 'Inuktitut'),
    (76, 'ja', 'Japanese (ja)'),
    (77, 'jv', 'Javanese (jv)'),
    (78, 'ka', 'Georgian'),
    (79, 'kg', 'Kongo'),
    (80, 'ki', 'Kikuyu, Gikuyu'),
    (81, 'kj', 'Kwanyama, Kuanyama'),
    (82, 'kk', 'Kazakh'),
    (83, 'kl', 'Kalaallisut, Greenlandic'),
    (84, 'km', 'Khmer'),
    (85, 'kn', 'Kannada'),
    (86, 'ko', 'Korean'),
    (87, 'kr', 'Kanuri'),
    (88, 'ks', 'Kashmiri'),
    (89, 'ku', 'Kurdish'),
    (90, 'kv', 'Komi'),
    (91, 'kw', 'Cornish'),
    (92, 'ky', 'Kirghiz, Kyrgyz'),
    (93, 'la', 'Latin'),
    (94, 'lb', 'Luxembourgish, Letzeburgesch'),
    (95, 'lg', 'Luganda'),
    (96, 'li', 'Limburgish, Limburgan, Limburger'),
    (97, 'ln', 'Lingala'),
    (98, 'lo', 'Lao'),
    (99, 'lt', 'Lithuanian'),
    (100, 'lu', 'Luba-Katanga'),
    (101, 'lv', 'Latvian'),
    (102, 'mg', 'Malagasy'),
    (103, 'mh', 'Marshallese'),
    (104, 'mi', 'Maori'),
    (105, 'mk', 'Macedonian'),
    (106, 'ml', 'Malayalam'),
    (107, 'mn', 'Mongolian'),
    (108, 'mr', 'Marathi (Mara?hi)'),
    (109, 'ms', 'Malay'),
    (110, 'mt', 'Maltese'),
    (111, 'my', 'Burmese'),
    (112, 'na', 'Nauru'),
    (113, 'nb', 'Norwegian BokmÃ¥l'),
    (114, 'nd', 'North Ndebele'),
    (115, 'ne', 'Nepali'),
    (116, 'ng', 'Ndonga'),
    (117, 'nl', 'Dutch'),
    (118, 'nn', 'Norwegian Nynorsk'),
    (119, 'no', 'Norwegian'),
    (120, 'nr', 'South Ndebele'),
    (121, 'nv', 'Navajo, Navaho'),
    (122, 'ny', 'Chichewa; Chewa; Nyanja'),
    (123, 'oc', 'Occitan'),
    (124, 'oj', 'Ojibwe, Ojibwa'),
    (125, 'om', 'Oromo'),
    (126, 'or', 'Oriya'),
    (127, 'os', 'Ossetian, Ossetic'),
    (128, 'pa', 'Panjabi, Punjabi'),
    (129, 'pi', 'Pali'),
    (130, 'pl', 'Polish'),
    (131, 'ps', 'Pashto, Pushto'),
    (132, 'pt', 'Portuguese'),
    (133, 'qu', 'Quechua'),
    (134, 'rm', 'Romansh'),
    (135, 'rn', 'Kirundi'),
    (136, 'ro', 'Romanian, Moldavian, Moldovan'),
    (137, 'ru', 'Russian'),
    (138, 'rw', 'Kinyarwanda'),
    (139, 'sa', 'Sanskrit (Sa?sk?ta)'),
    (140, 'sc', 'Sardinian'),
    (141, 'sd', 'Sindhi'),
    (142, 'se', 'Northern Sami'),
    (143, 'sg', 'Sango'),
    (144, 'si', 'Sinhala, Sinhalese'),
    (145, 'sk', 'Slovak'),
    (146, 'sl', 'Slovene'),
    (147, 'sm', 'Samoan'),
    (148, 'sn', 'Shona'),
    (149, 'so', 'Somali'),
    (150, 'sq', 'Albanian'),
    (151, 'sr', 'Serbian'),
    (152, 'ss', 'Swati'),
    (153, 'st', 'Southern Sotho'),
    (154, 'su', 'Sundanese'),
    (155, 'sv', 'Swedish'),
    (156, 'sw', 'Swahili'),
    (157, 'ta', 'Tamil'),
    (158, 'te', 'Telugu'),
    (159, 'tg', 'Tajik'),
    (160, 'th', 'Thai'),
    (161, 'ti', 'Tigrinya'),
    (162, 'tk', 'Turkmen'),
    (163, 'tl', 'Tagalog'),
    (164, 'tn', 'Tswana'),
    (165, 'to', 'Tonga (Tonga Islands)'),
    (166, 'tr', 'Turkish'),
    (167, 'ts', 'Tsonga'),
    (168, 'tt', 'Tatar'),
    (169, 'tw', 'Twi'),
    (170, 'ty', 'Tahitian'),
    (171, 'ug', 'Uighur, Uyghur'),
    (172, 'uk', 'Ukrainian'),
    (173, 'ur', 'Urdu'),
    (174, 'uz', 'Uzbek'),
    (175, 've', 'Venda'),
    (176, 'vi', 'Vietnamese'),
    (177, 'vo', 'VolapÃ¼k'),
    (178, 'wa', 'Walloon'),
    (179, 'wo', 'Wolof'),
    (180, 'xh', 'Xhosa'),
    (181, 'yi', 'Yiddish'),
    (182, 'yo', 'Yoruba'),
    (183, 'za', 'Zhuang, Chuang'),
    (184, 'zu', 'Zulu');


INSERT INTO `SupportedLanguages` (`name`, `description`) VALUES
    ('en', 'English'),
    ('de', 'German'),
    ('fr', 'French'),
    ('pl', 'Polish'),
    ('it', 'Italian'),
    ('si', 'Sinhala'),
    ('zh', 'Chinese'),
    ('ja', 'Japanese'),
    ('hi', 'Hindi'),
    ('es', 'Spanish');

INSERT INTO `LeavePeriods` (`id`, `name`, `date_start`, `date_end`, `status`) VALUES
  (3, 'Year 2015', '2015-01-01', '2015-12-31', 'Active'),
  (4, 'Year 2016', '2016-01-01', '2016-12-31', 'Active'),
  (5, 'Year 2017', '2017-01-01', '2017-12-31', 'Active');

INSERT INTO `LeaveTypes` (`id`, `name`, `supervisor_leave_assign`, `employee_can_apply`, `apply_beyond_current`, `leave_accrue`, `carried_forward`, `default_per_year`) VALUES
  (1, 'Annual leave', 'No', 'Yes', 'No', 'No', 'No', 14),
  (2, 'Casual leave', 'Yes', 'Yes', 'No', 'No', 'No', 7),
  (3, 'Medical leave', 'Yes', 'Yes', 'Yes', 'No', 'No', 7);

INSERT INTO `PayGrades` (`id`, `name`, `currency`, `min_salary`, `max_salary`) VALUES
  (1, 'Manager', 'SGD', '5000.00', '15000.00'),
  (2, 'Executive', 'SGD', '3500.00', '7000.00'),
  (3, 'Assistant ', 'SGD', '2000.00', '4000.00'),
  (4, 'Administrator', 'SGD', '2000.00', '6000.00');

INSERT INTO `Projects` (`id`, `name`, `client`, `details`, `created`, `status`) VALUES
  (1, 'Project 1', 3, NULL, '2013-01-03 05:53:38', 'Active'),
  (2, 'Project 2', 3, NULL, '2013-01-03 05:54:22', 'Active'),
  (3, 'Project 3', 1, NULL, '2013-01-03 05:55:02', 'Active'),
  (4, 'Project 4', 2, NULL, '2013-01-03 05:56:16', 'Active');

INSERT INTO `Skills` (`id`, `name`, `description`) VALUES
  (1, 'Programming and Application Development', 'Programming and Application Development'),
  (2, 'Project Management', 'Project Management'),
  (3, 'Help Desk/Technical Support', 'Help Desk/Technical Support'),
  (4, 'Networking', 'Networking'),
  (5, 'Databases', 'Databases'),
  (6, 'Business Intelligence', 'Business Intelligence'),
  (7, 'Cloud Computing', 'Cloud Computing'),
  (8, 'Information Security', 'Information Security'),
  (9, 'HTML Skills', 'HTML Skills'),
  (10, 'Graphic Designing', 'Graphic Designing');

INSERT INTO `EmploymentStatus` (`id`, `name`, `description`) VALUES
  (1, 'Full Time Contract', 'Full Time Contract'),
  (2, 'Full Time Internship', 'Full Time Internship'),
  (3, 'Full Time Permanent', 'Full Time Permanent'),
  (4, 'Part Time Contract', 'Part Time Contract'),
  (5, 'Part Time Internship', 'Part Time Internship'),
  (6, 'Part Time Permanent', 'Part Time Permanent');

INSERT INTO `FieldNameMappings` (`type`, `name`, `textOrig`, `textMapped`, `display`) VALUES
  ('Employee', 'employee_id', 'Employee Number', 'Employee Number', 'Table and Form'),
  ('Employee', 'first_name', 'First Name', 'First Name', 'Table and Form'),
  ('Employee', 'middle_name', 'Middle Name', 'Middle Name', 'Form'),
  ('Employee', 'last_name', 'Last Name', 'Last Name', 'Table and Form'),
  ('Employee', 'nationality', 'Nationality', 'Nationality', 'Form'),
  ('Employee', 'ethnicity', 'Ethnicity', 'Ethnicity', 'Form'),
  ('Employee', 'immigration_status', 'Immigration Status', 'Immigration Status', 'Form'),
  ('Employee', 'birthday', 'Date of Birth', 'Date of Birth', 'Form'),
  ('Employee', 'gender', 'Gender', 'Gender', 'Form'),
  ('Employee', 'marital_status', 'Marital Status', 'Marital Status', 'Form'),
  ('Employee', 'ssn_num', 'SSN/NRIC', 'SSN/NRIC', 'Form'),
  ('Employee', 'nic_num', 'NIC', 'NIC', 'Form'),
  ('Employee', 'other_id', 'Other ID', 'Other ID', 'Form'),
  ('Employee', 'driving_license', 'Driving License No', 'Driving License No', 'Form'),
  ('Employee', 'employment_status', 'Employment Status', 'Employment Status', 'Form'),
  ('Employee', 'job_title', 'Job Title', 'Job Title', 'Form'),
  ('Employee', 'pay_grade', 'Pay Grade', 'Pay Grade', 'Form'),
  ('Employee', 'work_station_id', 'Work Station Id', 'Work Station Id', 'Form'),
  ('Employee', 'address1', 'Address Line 1', 'Address Line 1', 'Form'),
  ('Employee', 'address2', 'Address Line 2', 'Address Line 2', 'Form'),
  ('Employee', 'city', 'City', 'City', 'Form'),
  ('Employee', 'country', 'Country', 'Country', 'Form'),
  ('Employee', 'province', 'Province', 'Province', 'Form'),
  ('Employee', 'postal_code', 'Postal/Zip Code', 'Postal/Zip Code', 'Form'),
  ('Employee', 'home_phone', 'Home Phone', 'Home Phone', 'Form'),
  ('Employee', 'mobile_phone', 'Mobile Phone', 'Mobile Phone', 'Table and Form'),
  ('Employee', 'work_phone', 'Work Phone', 'Work Phone', 'Form'),
  ('Employee', 'work_email', 'Work Email', 'Work Email', 'Form'),
  ('Employee', 'private_email', 'Private Email', 'Private Email', 'Form'),
  ('Employee', 'joined_date', 'Joined Date', 'Joined Date', 'Form'),
  ('Employee', 'confirmation_date', 'Confirmation Date', 'Confirmation Date', 'Form'),
  ('Employee', 'termination_date', 'Termination Date', 'Termination Date', 'Form'),
  ('Employee', 'supervisor', 'Supervisor', 'Supervisor', 'Table and Form'),
  ('Employee', 'department', 'Department', 'Department', 'Table and Form'),
  ('Employee', 'indirect_supervisors', 'Indirect Supervisors', 'Indirect Supervisors', 'Form'),
  ('Employee', 'notes', 'Notes', 'Notes', 'Form');


INSERT INTO `ImmigrationStatus` VALUES
  (1,'Citizen'),
  (2,'Permanent Resident'),
  (3,'Work Permit Holder'),
  (4,'Dependant Pass Holder');

INSERT INTO `Ethnicity` VALUES
  (1,'White American'),
  (2,'Black or African American'),
  (3,'Native American'),
  (4,'Alaska Native'),
  (5,'Asian American'),
  (6,'Native Hawaiian'),
  (7,'Pacific Islander');

INSERT INTO `PayFrequency` VALUES
  (1,'Bi Weekly'),
  (2,'Weekly'),
  (3,'Semi Monthly'),
  (4,'Monthly'),
  (5,'Yearly');


INSERT INTO `Employees` (`id`, `employee_id`, `first_name`, `middle_name`, `last_name`, `nationality`, `birthday`, `gender`, `marital_status`, `ssn_num`, `nic_num`, `other_id`, `driving_license`, `driving_license_exp_date`, `employment_status`, `job_title`, `pay_grade`, `work_station_id`, `address1`, `address2`, `city`, `country`, `province`, `postal_code`, `home_phone`, `mobile_phone`, `work_phone`, `work_email`, `private_email`, `joined_date`, `confirmation_date`, `supervisor`, `department`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`) VALUES
  (1, 'EMP001', 'IceHrm', 'Sample', 'Employee', 35, '1984-03-17 18:30:00', 'Male', 'Married', '', '294-38-3535', '294-38-3535', '', NULL, 3, 11, 2, '', '2772 Flynn Street', 'Willoughby', 'Willoughby', 'US', 41, '44094', '440-953-4578', '440-953-4578', '440-953-4578', 'icehrm+admin@web-stalk.com', 'icehrm+admin@web-stalk.com', '2005-08-03 18:00:00', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO `UserRoles` VALUES
  (1,'Report Manager'),
  (2,'Attendance Manager');


INSERT INTO `Users` VALUES
(1,'admin','icehrm+admin@web-stalk.com','21232f297a57a5a743894a0e4a801fc3',1,NULL,'Admin','',NULL,NULL,NULL,NULL,NULL);


INSERT INTO `SalaryComponentType` (`id`,`code`, `name`) VALUES
  (1,'B001', 'Basic'),
  (2,'B002', 'Allowance'),
  (3,'B003', 'Hourly');


INSERT INTO `SalaryComponent` (`id`,`name`, `componentType`) VALUES
  (1,'Basic Salary', 1),
  (2,'Fixed Allowance', 1),
  (3,'Car Allowance', 2),
  (4,'Telephone Allowance', 2),
  (5,'Regular Hourly Pay', 3),
  (6,'Overtime Hourly Pay', 3),
  (7,'Double Time Hourly Pay', 3);


INSERT INTO `Courses` (`id`,`code`, `name`, `description`, `coordinator`, `trainer`, `trainer_info`, `paymentType`, `currency`, `cost`, `status`, `created`, `updated`) VALUES
  (1,'C0001', 'Info Marketing', 'Learn how to Create and Outsource Info Marketing Products', 1, 'Tim Jhon', 'Tim Jhon has a background in business management and has been working with small business to establish their online presence','Company Sponsored','USD','55','Active',now(), now()),
  (2,'C0002', 'People Management', 'Learn how to Manage People', 1, 'Tim Jhon', 'Tim Jhon has a background in business management and has been working with small business to establish their online presence','Company Sponsored','USD','59','Active',now(), now());

INSERT INTO `EmployementType` (`name`) VALUES
  ('Full-time'),
  ('Part-time'),
  ('Contract'),
  ('Temporary'),
  ('Other');

INSERT INTO `Benifits` (`name`) VALUES
  ('Retirement plan'),
  ('Health plan'),
  ('Life insurance'),
  ('Paid vacations');



INSERT INTO `ExperienceLevel` (`name`) VALUES
  ('Not Applicable'),
  ('Internship'),
  ('Entry level'),
  ('Associate'),
  ('Mid-Senior level'),
  ('Director'),
  ('Executive');

INSERT INTO `JobFunction` (`name`) VALUES
  ('Accounting/Auditing'),
  ('Administrative'),
  ('Advertising'),
  ('Business Analyst'),
  ('Financial Analyst'),
  ('Data Analyst'),
  ('Art/Creative'),
  ('Business Development'),
  ('Consulting'),
  ('Customer Service'),
  ('Distribution'),
  ('Design'),
  ('Education'),
  ('Engineering'),
  ('Finance'),
  ('General Business'),
  ('Health Care Provider'),
  ('Human Resources'),
  ('Information Technology'),
  ('Legal'),
  ('Management'),
  ('Manufacturing'),
  ('Marketing'),
  ('Other'),
  ('Public Relations'),
  ('Purchasing'),
  ('Product Management'),
  ('Project Management'),
  ('Production'),
  ('Quality Assurance'),
  ('Research'),
  ('Sales'),
  ('Science'),
  ('Strategy/Planning'),
  ('Supply Chain'),
  ('Training'),
  ('Writing/Editing');


INSERT INTO `EducationLevel` (`name`) VALUES
  ('Unspecified'),
  ('High School or equivalent'),
  ('Certification'),
  ('Vocational'),
  ('Associate Degree'),
  ('Bachelor\'s Degree'),
  ('Master\'s Degree'),
  ('Doctorate'),
  ('Professional'),
  ('Some College Coursework Completed'),
  ('Vocational - HS Diploma'),
  ('Vocational - Degree'),
  ('Some High School Coursework');


INSERT INTO `Crons` (`name`,`class`, `lastrun`, `frequency`, `time`, `type`, `status`) VALUES
  ('Email Sender Task', 'EmailSenderTask', NULL, 1, 1, 'Minutely', 'Enabled'),
  ('Document Expire Alert', 'DocumentExpiryNotificationTask', NULL, 1, (FLOOR( 1 + RAND( ) *58 )), 'Hourly', 'Enabled');


INSERT INTO `ExpensesPaymentMethods` (`name`) VALUES
  ('Cash'),
  ('Check'),
  ('Credit Card'),
  ('Debit Card');


INSERT INTO `ExpensesCategories` (`name`) VALUES
('Auto - Gas'),
('Auto - Insurance'),
('Auto - Maintenance'),
('Auto - Payment'),
('Transportation'),
('Bank Fees'),
('Dining Out'),
('Entertainment'),
('Hotel / Motel'),
('Insurance'),
('Interest Charges'),
('Loan Payment'),
('Medical'),
('Mileage'),
('Rent'),
('Rental Car'),
('Utility');






INSERT INTO `DataImport` (`name`, `dataType`, `details`, `columns`, `updated`, `created`) VALUES
    ('Employee Data Import', 'EmployeeDataImporter', '', '[{"name":"employee_id","title":"","type":"Normal","dependOn":"NULL","dependOnField":"","isKeyField":"No","idField":"Yes","id":"columns_7"},{"name":"first_name","title":"","type":"Normal","dependOn":"NULL","dependOnField":"","isKeyField":"No","idField":"No","id":"columns_3"},{"name":"middle_name","title":"","type":"Normal","dependOn":"NULL","dependOnField":"","isKeyField":"No","idField":"No","id":"columns_5"},{"name":"last_name","title":"","type":"Normal","dependOn":"NULL","dependOnField":"","isKeyField":"No","idField":"No","id":"columns_6"},{"name":"address1","title":"Address1","type":"Normal","dependOn":"NULL","dependOnField":"","isKeyField":"No","idField":"No","id":"columns_8"},{"name":"address2","title":"Address2","type":"Normal","dependOn":"NULL","dependOnField":"","isKeyField":"No","idField":"No","id":"columns_9"},{"name":"home_phone","title":"","type":"Normal","dependOn":"NULL","dependOnField":"","isKeyField":"No","idField":"No","id":"columns_14"},{"name":"mobile_phone","title":"","type":"Normal","dependOn":"NULL","dependOnField":"","isKeyField":"No","idField":"No","id":"columns_15"},{"name":"work_email","title":"","type":"Normal","dependOn":"NULL","dependOnField":"","isKeyField":"No","idField":"No","id":"columns_16"},{"name":"gender","title":"","type":"Normal","dependOn":"NULL","dependOnField":"","isKeyField":"No","idField":"No","id":"columns_17"},{"name":"marital_status","title":"","type":"Normal","dependOn":"NULL","dependOnField":"","isKeyField":"No","idField":"No","id":"columns_18"},{"name":"birthday","title":"","type":"Normal","dependOn":"NULL","dependOnField":"","isKeyField":"No","idField":"No","id":"columns_20"},{"name":"nationality","title":"Nationality","type":"Reference","dependOn":"Nationality","dependOnField":"name","isKeyField":"Yes","idField":"No","id":"columns_22"},{"name":"ethnicity","title":"Ethnicity","type":"Normal","dependOn":"Ethnicity","dependOnField":"name","isKeyField":"Yes","idField":"No","id":"columns_23"},{"name":"EmergencyContact/name","title":"","type":"Attached","dependOn":"EmergencyContact","dependOnField":"name","isKeyField":"Yes","idField":"No","id":"columns_24"},{"name":"EmergencyContact/relationship","title":"","type":"Attached","dependOn":"EmergencyContact","dependOnField":"relationship","isKeyField":"No","idField":"No","id":"columns_25"},{"name":"EmergencyContact/home_phone","title":"","type":"Attached","dependOn":"EmergencyContact","dependOnField":"home_phone","isKeyField":"No","idField":"No","id":"columns_26"},{"name":"ssn_num","title":"","type":"Normal","dependOn":"NULL","dependOnField":"","isKeyField":"No","idField":"No","id":"columns_31"},{"name":"job_title","title":"","type":"Reference","dependOn":"JobTitle","dependOnField":"name","isKeyField":"Yes","idField":"No","id":"columns_32"},{"name":"employment_status","title":"","type":"Reference","dependOn":"EmploymentStatus","dependOnField":"name","isKeyField":"Yes","idField":"No","id":"columns_33"},{"name":"joined_date","title":"","type":"Normal","dependOn":"NULL","dependOnField":"","isKeyField":"No","idField":"No","id":"columns_36"},{"name":"department","title":"","type":"Reference","dependOn":"CompanyStructure","dependOnField":"title","isKeyField":"Yes","idField":"No","id":"columns_38"}]', '2016-06-02 18:56:32', '2016-06-02 18:56:32'),
    ('Attendance Data Import', 'AttendanceDataImporter', '', '[{"name":"employee","title":"","type":"Reference","dependOn":"Employee","dependOnField":"employee_id","isKeyField":"Yes","idField":"No","id":"columns_1"},{"name":"in_time","title":"","type":"Normal","dependOn":"NULL","dependOnField":"","isKeyField":"No","idField":"No","id":"columns_2"},{"name":"out_time","title":"","type":"Normal","dependOn":"NULL","dependOnField":"","isKeyField":"No","idField":"No","id":"columns_3"},{"name":"note","title":"","type":"Normal","dependOn":"NULL","dependOnField":"","isKeyField":"No","idField":"No","id":"columns_4"}]', '2016-08-14 02:51:56', '2016-08-14 02:51:56');




REPLACE INTO `UserReports` (`name`, `details`, `parameters`, `query`, `paramOrder`, `type`,`report_group`,`output`) VALUES
  ('Time Entry Report', 'View your time entries by date range and project',
   '[\r\n[ "client", {"label":"Select Client","type":"select","allow-null":true,"null-label":"Not Selected","remote-source":["Client","id","name"]}],\r\n[ "project", {"label":"Or Project","type":"select","allow-null":true,"null-label":"All Projects","remote-source":["Project","id","name","getAllProjects"]}],\r\n[ "date_start", {"label":"Start Date","type":"date"}],\r\n[ "date_end", {"label":"End Date","type":"date"}]\r\n]',
   'EmployeeTimesheetReport', '["client","project","date_start","date_end","status"]', 'Class','Time Management','CSV');

REPLACE INTO `UserReports` (`name`, `details`, `parameters`, `query`, `paramOrder`, `type`,`report_group`,`output`) VALUES
  ('Attendance Report', 'View your attendance entries by date range', '[\r\n[ "date_start", {"label":"Start Date","type":"date"}],\r\n[ "date_end", {"label":"End Date","type":"date"}]\r\n]', 'EmployeeAttendanceReport', '["date_start","date_end"]', 'Class','Time Management','CSV');

REPLACE INTO `UserReports` (`name`, `details`, `parameters`, `query`, `paramOrder`, `type`,`report_group`,`output`) VALUES
  ('Time Tracking Report', 'View your working hours and attendance details for each day for a given period ', '[\r\n[ "date_start", {"label":"Start Date","type":"date"}],\r\n[ "date_end", {"label":"End Date","type":"date"}]\r\n]', 'EmployeeTimeTrackReport', '["date_start","date_end"]', 'Class','Time Management','CSV');


REPLACE INTO `UserReports` (`name`, `details`, `parameters`, `query`, `paramOrder`, `type`,`report_group`,`output`) VALUES
  ('Travel Request Report', 'View travel requests for a specified period',
   '[\r\n[ "date_start", {"label":"Start Date","type":"date"}],\r\n[ "date_end", {"label":"End Date","type":"date"}],\r\n[ "status", {"label":"Status","type":"select","source":[["NULL","All Statuses"],["Approved","Approved"],["Pending","Pending"],["Rejected","Rejected"],["Cancellation Requested","Cancellation Requested"],["Cancelled","Cancelled"]]}]\r\n]',
   'TravelRequestReport',
   '["date_start","date_end","status"]', 'Class', 'Travel and Expense Management','CSV');


REPLACE INTO `UserReports` (`name`, `details`, `parameters`, `query`, `paramOrder`, `type`,`report_group`,`output`) VALUES
  ('Time Sheet Report', 'This report list all employee time sheets by employee and date range',
   '[\r\n[ "date_start", {"label":"Start Date","type":"date"}],\r\n[ "date_end", {"label":"End Date","type":"date"}],\r\n[ "status", {"label":"Status","allow-null":true,"null-label":"All Status","type":"select","source":[["Approved","Approved"],["Pending","Pending"],["Rejected","Rejected"]]}]\r\n]',
   'EmployeeTimeSheetData',
   '["date_start","date_end","status"]', 'Class','Time Management','CSV');


REPLACE INTO `UserReports` (`name`, `details`, `parameters`, `query`, `paramOrder`, `type`,`report_group`,`output`) VALUES
  ('Client Project Time Report', 'View your time entries for projects under a given client',
   '[\r\n[ "client", {"label":"Select Client","type":"select","allow-null":false,"remote-source":["Client","id","name"]}],\r\n[ "date_start", {"label":"Start Date","type":"date"}],\r\n[ "date_end", {"label":"End Date","type":"date"}]\r\n]',
   'ClientProjectTimeReport', '["client","date_start","date_end","status"]', 'Class','Time Management','PDF');

REPLACE INTO `UserReports` (`name`, `details`, `parameters`, `query`, `paramOrder`, `type`,`report_group`,`output`) VALUES
    ('Download Payslips', 'Download your payslips',
     '[\r\n[ "payroll", {"label":"Select Payroll","type":"select","allow-null":false,"remote-source":["Payroll","id","name","getEmployeePayrolls"]}]]',
     'PayslipReport', '["payroll"]', 'Class','Finance','PDF');


INSERT INTO `Settings` (`name`, `value`, `description`, `meta`) VALUES
  ('Instance : ID', '0847429146712c108e23c435e8f93b4d', '',''),
  ('Instance: Key', 'UQHEYBx9H1eNR66nhNCNCz1WCDDhkjtx1OuJbO3ZQMt+8tfSGvuOH/YEHntRajY=', '','');



/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

DELIMITER $$
CREATE FUNCTION generate_fname () RETURNS varchar(255)
BEGIN
    RETURN ELT(FLOOR(1 + (RAND() * (100-1))), "James","Mary","John","Patricia","Robert","Linda","Michael","Barbara","William","Elizabeth","David","Jennifer","Richard","Maria","Charles","Susan","Joseph","Margaret","Thomas","Dorothy","Christopher","Lisa","Daniel","Nancy","Paul","Karen","Mark","Betty","Donald","Helen","George","Sandra","Kenneth","Donna","Steven","Carol","Edward","Ruth","Brian","Sharon","Ronald","Michelle","Anthony","Laura","Kevin","Sarah","Jason","Kimberly","Matthew","Deborah","Gary","Jessica","Timothy","Shirley","Jose","Cynthia","Larry","Angela","Jeffrey","Melissa","Frank","Brenda","Scott","Amy","Eric","Anna","Stephen","Rebecca","Andrew","Virginia","Raymond","Kathleen","Gregory","Pamela","Joshua","Martha","Jerry","Debra","Dennis","Amanda","Walter","Stephanie","Patrick","Carolyn","Peter","Christine","Harold","Marie","Douglas","Janet","Henry","Catherine","Carl","Frances","Arthur","Ann","Ryan","Joyce","Roger","Diane");
END$$

DELIMITER ;

DELIMITER $$
CREATE FUNCTION generate_lname () RETURNS varchar(255)
BEGIN
    RETURN ELT(FLOOR(1 + (RAND() * (100-1))), "Smith","Johnson","Williams","Jones","Brown","Davis","Miller","Wilson","Moore","Taylor","Anderson","Thomas","Jackson","White","Harris","Martin","Thompson","Garcia","Martinez","Robinson","Clark","Rodriguez","Lewis","Lee","Walker","Hall","Allen","Young","Hernandez","King","Wright","Lopez","Hill","Scott","Green","Adams","Baker","Gonzalez","Nelson","Carter","Mitchell","Perez","Roberts","Turner","Phillips","Campbell","Parker","Evans","Edwards","Collins","Stewart","Sanchez","Morris","Rogers","Reed","Cook","Morgan","Bell","Murphy","Bailey","Rivera","Cooper","Richardson","Cox","Howard","Ward","Torres","Peterson","Gray","Ramirez","James","Watson","Brooks","Kelly","Sanders","Price","Bennett","Wood","Barnes","Ross","Henderson","Coleman","Jenkins","Perry","Powell","Long","Patterson","Hughes","Flores","Washington","Butler","Simmons","Foster","Gonzales","Bryant","Alexander","Russell","Griffin","Diaz","Hayes");
END$$
DELIMITER ;

INSERT INTO `CompanyStructures` (`id`, `title`, `description`, `address`, `type`, `country`, `parent`) VALUES
(4, 'Development Center', 'Development Center', 'PO Box 001002\nSample Road, Sample Town', 'Regional Office', 'SG', 1),
(5, 'Engineering Department', 'Engineering Department', 'PO Box 001002\nSample Road, Sample Town,  341234', 'Department', 'SG', 4),
(6, 'Development Team', 'Development Team', '', 'Unit', 'SG', 5),
(7, 'QA Team', 'QA Team', '', 'Unit', 'SG', 5),
(8, 'Server Administration', 'Server Administration', '', 'Unit', 'SG', 5),
(9, 'Administration & HR', 'Administration and Human Resource', '', 'Department', 'SG', 4);


INSERT INTO `Employees` (`id`, `employee_id`, `first_name`, `middle_name`, `last_name`, `nationality`, `birthday`, `gender`, `marital_status`, `ssn_num`, `nic_num`, `other_id`, `driving_license`, `driving_license_exp_date`, `employment_status`, `job_title`, `pay_grade`, `work_station_id`, `address1`, `address2`, `city`, `country`, `province`, `postal_code`, `home_phone`, `mobile_phone`, `work_phone`, `work_email`, `private_email`, `joined_date`, `confirmation_date`, `supervisor`, `department`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`,`indirect_supervisors`) VALUES
(2, 'EMP002', 'Lala', 'Nadila ', 'Lamees', 175, '1984-03-12 18:30:00', 'Female', 'Single', '', '4594567WE3', '4595567WE3', '349-066-YUO', '2012-03-01', 1, 8, 2, 'W001', 'Green War Rd, 00123', '', 'Istanbul', 'TR', NULL, '909066', '+960112345', '+960112345', '+960112345', 'icehrm+manager@web-stalk.com', 'icehrm+manager@web-stalk.com', '2011-03-07 18:30:00', '2012-02-14 18:30:00', 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL),
(3, 'EMP003', 'Sofia', '', 'O''Sullivan', 4, '1975-08-28 18:30:00', 'Female', 'Married', '', '768-20-4394', '768-20-4394', '', NULL, 3, 10, 2, '', '2792 Trails End Road', 'Fort Lauderdale', 'Fort Lauderdale', 'US', 12, '33308', '954-388-3340', '954-388-3340', '954-388-3340', 'icehrm+user1@web-stalk.com', 'icehrm+user1@web-stalk.com', '2010-02-08 18:30:00', NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,'[\"1\"]'),
(4, 'EMP004', 'Taylor', '', 'Holmes', 10, '1979-07-15 18:30:00', 'Male', 'Single', '158-06-2292', '158-06-2292', '', '', NULL, 1, 5, 2, '', '1164', 'Walnut Avenue', 'Rochelle Park', 'US', 35, '7662', '201-474-8048', '201-474-8048', '201-474-8048', 'icehrm+user2@web-stalk.com', 'icehrm+user2@web-stalk.com', '2006-07-12 18:30:00', NULL, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL);



UPDATE `Employees` set supervisor = 2, indirect_supervisors = '[3,4]', approver1 = 5, approver2 = 6, approver3 = 7 where id = 1;
UPDATE `Employees` set supervisor = 1, indirect_supervisors = '[3,4]', approver1 = 5, approver2 = 6 where id = 2;
UPDATE `Employees` set supervisor = 2, indirect_supervisors = '[1,4]', approver1 = 5 where id = 3;

INSERT INTO `EmergencyContacts` (`id`, `employee`, `name`, `relationship`, `home_phone`, `work_phone`, `mobile_phone`) VALUES
(1, 1, 'Emma Owns', 'Mother', '+874463422', '+874463422', '+874463422'),
(2, 2, 'Casey Watson', 'Sister', '231-453-876', '231-453-876', '231-453-876');


INSERT INTO `EmployeeCertifications` (`id`, `certification_id`, `employee`, `institute`, `date_start`, `date_end`) VALUES
(1, 21, 1, 'PHR', '2012-06-04', '2016-06-13'),
(2, 19, 1, 'CPA', '2010-02-16', '2019-02-28'),
(3, 17, 2, 'PMP', '2011-06-14', '2019-10-20'),
(4, 3, 2, 'PMI', '2004-06-08', '2017-09-14');

INSERT INTO `EmployeeCompanyLoans` (`id`, `employee`, `loan`, `start_date`, `last_installment_date`, `period_months`, `amount`, `monthly_installment`, `status`, `details`) VALUES
(1, 2, 2, '2013-02-05', '2016-02-05', 12, '12000.00', '1059.45', 'Approved', '');

INSERT INTO `EmployeeDependents` (`id`, `employee`, `name`, `relationship`, `dob`, `id_number`) VALUES
(1, 1, 'Emma Owns', 'Parent', '1940-06-11', '475209UHB'),
(2, 1, 'Mica Singroo', 'Other', '2000-06-13', '');


INSERT INTO `EmployeeEducations` (`id`, `education_id`, `employee`, `institute`, `date_start`, `date_end`) VALUES
(1, 1, 1, 'National University of Turky', '2004-02-03', '2006-06-13'),
(2, 1, 2, 'MIT', '1995-02-21', '1999-10-12');


INSERT INTO `EmployeeLanguages` (`id`, `language_id`, `employee`, `reading`, `speaking`, `writing`, `understanding`) VALUES
(1, 1, 1, 'Full Professional Proficiency', 'Full Professional Proficiency', 'Full Professional Proficiency', 'Native or Bilingual Proficiency'),
(2, 1, 2, 'Native or Bilingual Proficiency', 'Native or Bilingual Proficiency', 'Native or Bilingual Proficiency', 'Native or Bilingual Proficiency'),
(3, 2, 2, 'Limited Working Proficiency', 'Professional Working Proficiency', 'Limited Working Proficiency', 'Professional Working Proficiency');


INSERT INTO `EmployeeProjects` (`id`, `employee`, `project`, `date_start`, `date_end`, `status`, `details`) VALUES
(1, 2, 1, '2010-03-18', '2014-03-06', 'Inactive', ''),
(3, 2, 2, '2013-02-05', '2013-02-11', 'Current', ''),
(5, 2, 3, '2013-02-24', NULL, 'Current', '');


INSERT INTO `EmployeeSalary` (`employee`, `component`,`amount`, `details`) VALUES
(1, 1,'50000.00', ''),
(1, 2,'20000.00', ''),
(1, 3,'30000.00', ''),
(1, 4,'2000.00', ''),

(2, 1,'90500.00', ''),
(2, 2,'40000.00', ''),
(2, 3,'50000.00', ''),

(3, 1,'131409.00', ''),
(3, 2,'143471.00', ''),
(3, 3,'50000.00', ''),
(3, 4,'30000.00', ''),

(4, 5,'1432.00', ''),
(4, 6,'2100.00', ''),

(5, 5,'1200.00', ''),
(5, 6,'1500.00', ''),
(5, 7,'2000.00', ''),

(5, 1,round(rand() * 100000 + rand() * 20000 - rand() * 20000, 2), ''),
(6, 1,round(rand() * 100000 + rand() * 20000 - rand() * 20000, 2), ''),
(7, 1,round(rand() * 100000 + rand() * 20000 - rand() * 20000, 2), ''),
(8, 1,round(rand() * 100000 + rand() * 20000 - rand() * 20000, 2), ''),
(9, 1,round(rand() * 100000 + rand() * 20000 - rand() * 20000, 2), ''),
(10, 1,round(rand() * 100000 + rand() * 20000 - rand() * 20000, 2), ''),
(11, 1,round(rand() * 100000 + rand() * 20000 - rand() * 20000, 2), ''),
(12, 1,round(rand() * 100000 + rand() * 20000 - rand() * 20000, 2), ''),
(13, 1,round(rand() * 100000 + rand() * 20000 - rand() * 20000, 2), ''),
(14, 1,round(rand() * 100000 + rand() * 20000 - rand() * 20000, 2), '');

INSERT INTO `EmployeeSkills` (`id`, `skill_id`, `employee`, `details`) VALUES
(1, 9, 1, 'Creating web sites'),
(2, 6, 2, 'Certified Business Intelligence Professional');




INSERT INTO `LeaveRules` (`id`, `leave_type`, `job_title`, `employment_status`, `employee`, `supervisor_leave_assign`, `employee_can_apply`, `apply_beyond_current`, `leave_accrue`, `carried_forward`, `default_per_year`) VALUES
(1, 1, 11, NULL, NULL, 'No', 'Yes', 'Yes', 'No', 'No', 25),
(2, 2, NULL, NULL, 2, 'No', 'Yes', 'Yes', 'No', 'No', 10);



INSERT INTO `Users` (`id`, `username`, `email`, `password`, `employee`,`default_module`, `user_level`,`user_roles`, `last_login`, `last_update`, `created`) VALUES
(2, 'manager', 'icehrm+manager@web-stalk.com', '4048bb914a704a0728549a26b92d8550', 2,NULL, 'Manager','', '2013-01-03 02:47:37', '2013-01-03 02:47:37', '2013-01-03 02:47:37'),
(3, 'user1', 'icehrm+user1@web-stalk.com', '4048bb914a704a0728549a26b92d8550', 3,NULL, 'Employee','', '2013-01-03 02:48:32', '2013-01-03 02:48:32', '2013-01-03 02:48:32'),
(4, 'user2', 'icehrm+user2@web-stalk.com', '4048bb914a704a0728549a26b92d8550', 4,NULL, 'Employee','', '2013-01-03 02:58:55', '2013-01-03 02:58:55', '2013-01-03 02:58:55'),
(5, 'user3', 'icehrm+user3@web-stalk.com', '4048bb914a704a0728549a26b92d8550', NULL,NULL, 'Other','["1"]', '2013-01-03 02:58:55', '2013-01-03 02:58:55', '2013-01-03 02:58:55');

INSERT INTO `Job` VALUES
(1,'Software Engineer','More than 375,000 users world-wide rely on our software for their daily business as it makes creating graphical presentations so much easier, faster and more enjoyable. Among our customers are many renowned consulting companies and large international corporations.','More than 375,000 users world-wide rely on our software for their daily business as it makes creating graphical presentations so much easier, faster and more enjoyable. Among our customers are many renowned consulting companies and large international corporations.\n\nWe follow our own strategy and do not have to make compromises with regard to code quality and beauty, because think-cell is profitable and has no outside investors. We are flourishing without program managers, meetings, and marketing-driven deadlines. Our code quality is extraordinarily high because we only release software when it is ready. We are willing to do the leg work of developing sophisticated algorithms and refining our user interface, which makes working with think-cellâ€™s software so satisfying.','Challenging C++ coding with high personal responsibility\nWork with a competent and creative team in a modern loft office in Berlin\nFamily-friendly working hours, no deadlines\nAbove-average salary (we offer our developers EUR 120,000 annually after one year of employment)\nFree supply of drinks, fruits, sweets and snacks\nFlat hierarchies and plenty of room for your ideas\nA full-time company nanny who is available for free when children are sick, or when you just feel like spending an evening out','[\"Health plan\",\"Paid vacations\"]',226,2,NULL,'JC001',1,NULL,7,14,9,151,'Yes',3500,5500,'job, engineer','Active',NULL,NULL,'Text Only',1),
(2,'QA Senior Test Automation Engineer','As a QA Senior Test Automation Engineer at Rocket you will help us launch the most successful startup companies around the world.','As a QA Senior Test Automation Engineer at Rocket you will help us launch the most successful startup companies around the world.','Responsibilities:\n\nAutomated testing of web and mobile applications\nDevelop automated scenarios/scripts using Cucumber (for web applications) and Calabash (for mobile applications)\nOptimize existing test cases to get more stability and efficiency\nRun automated functional tests as well as performance and load tests\nAnalyze automated test results and report bugs to responsible employees\nSupport the test automation team during the whole development process (starting from the analysis of requirements up to the integration of automated test cases into the CI system (Jenkins)\n\n\nRequirements:\n\nSeveral years of experience as a Test Automation Engineer ( 5+ years )\nExperience with automated solutions such as Cucumber/Calabash, Gherkin, Selenium or similar tools/frameworks\nExperience with Ruby, Python, PHP, JAVA or similar programming languages\nExperience with source code controls like SVN, GIT, CVS\nFamiliarity with Continuous Integration and Delivery\nExperience in Agile Methodologies like Scrum and Kanban or extreme programming\nFluency in speaking & writing English skills\nISTQB certification\n Technology stack we use:\n\nTools: GitHub, Jira, Confluence, Bamboo, Jenkins, Testlink\nScrum, Kanban\nCucumber, Calabash, Capybara, JMeter','[\"Life insurance\"]',80,3,NULL,'JC002',3,NULL,5,14,6,151,'Yes',4000,4500,'','Active',NULL,NULL,'Text Only',1),
(3,'Online Editor','Online Editors required for a reputed news agency','Online Editors required for a reputed news agency','','[]',129,NULL,NULL,'J0003',1,NULL,7,23,9,103,'No',0,0,'','Active','0001-01-01 00:00:00','attachment_BI5XQCYFxZO12W1447383181684','Image and Full Text',1);

INSERT INTO `Candidates` VALUES
(1,'Jhon','Doe',4,NULL,'Male',NULL,NULL,NULL,'New York','US',NULL,NULL,'icehrm+jhon@web-stalk.com','+1 455565656',NULL,'Software Engineer','cv_rYwHphV7xD5dOe1444302569136',NULL,NULL,NULL,'','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,'2015-10-08 16:59:20','2015-10-08 16:59:20',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'663fd20d1859344585f678a0f87b23522b8f9fce8c67c5290a609ce342b81442',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

INSERT INTO `Files` VALUES
(6,'attachment_BI5XQCYFxZO12W1447383181684','attachment_BI5XQCYFxZO12W1447383181684.png',1,'Job',2000,'2MB');


INSERT INTO `EmployeeDocuments` (`id`,`employee`, `document`, `date_added`, `valid_until`, `status`, `details`, `attachment`, `expire_notification_last`) VALUES
(1, 1, 1, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 30 DAY), 'Active', '', NULL, -1),
(2, 1, 2, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 7 DAY), 'Active', '', NULL, -1),
(3, 1, 3, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 DAY), 'Active', '', NULL, -1);



INSERT INTO `Attendance` (`employee`,`in_time`,`out_time`,`note`) VALUES
(1, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 30 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 30 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(1, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 29 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 29 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(1, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 28 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 28 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(1, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 27 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 27 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(1, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 26 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 26 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(1, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 25 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 25 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(1, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 24 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 24 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(1, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 23 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 23 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(1, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 22 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 22 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(1, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 21 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 21 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(1, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 20 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 20 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(1, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 19 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 19 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(1, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 18 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 18 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(1, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 17 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 17 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(1, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 16 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 16 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(1, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 15 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 15 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),



(2, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 30 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 30 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(2, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 29 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 29 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(2, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 28 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 28 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(2, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 27 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 27 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(2, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 26 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 26 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(2, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 25 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 25 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(2, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 24 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 24 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(2, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 23 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 23 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(2, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 22 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 22 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),


(3, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 30 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 30 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(3, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 29 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 29 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(3, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 28 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 28 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(3, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 27 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 27 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(3, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 26 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 26 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(3, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 25 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 25 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(3, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 24 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 24 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(3, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 23 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 23 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), ''),
(3, FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 22 DAY))) + FLOOR(28800 + (RAND() * 3600)),'%Y-%m-%d %T'), FROM_UNIXTIME((UNIX_TIMESTAMP(DATE_SUB(CURDATE(), INTERVAL 22 DAY))) + FLOOR(57600 + (RAND() * 21600)),'%Y-%m-%d %T'), '');




INSERT INTO `PayrollEmployees` VALUES
(1,1,4,151,'[]','[]',1),
(2,2,4,151,'[]','[]',1),
(3,3,4,151,'[]','[]',1),
(4,4,2,151,'[]','[]',1),
(5,5,2,151,'[]','[]',1),
(6,6,4,151,'[]','[]',1),
(7,7,4,151,'[]','[]',1),
(8,8,4,151,'[]','[]',1),
(9,9,4,151,'[]','[]',1),
(10,10,4,151,'[]','[]',1);


/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;






