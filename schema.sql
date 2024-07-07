-- Create the database
    CREATE DATABASE 'BlueCrossBloodBank';

-- Use the database
    USE 'BlueCrossBloodBank';

-- ================================================================
-- Create the tables
-- ================================================================
-- Create the Blood bank table
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloodBank](
                                  [blood_bank_id] [int] IDENTITY(12,1) NOT NULL,
                                  [blood_bank_name] [nvarchar](50) NOT NULL,
                                  [blood_bank_address] [nvarchar](100) NOT NULL,
                                  [blood_bank_state] [nchar](2) NOT NULL,
                                  [blood_bank_zipcode] [int] NOT NULL,
                                  [blood_bank_phone_number] [nvarchar](15) NOT NULL,
                                  [blood_bank_email] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BloodBank] ADD  CONSTRAINT [PK_BloodBank] PRIMARY KEY CLUSTERED
    (
     [blood_bank_id] ASC
        )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

-- Create the BloodTypes table

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BloodTypes](
                                   [blood_type_id] [int] NOT NULL,
                                   [blood_type] [nchar](3) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BloodTypes] ADD  CONSTRAINT [PK_BloodTypes] PRIMARY KEY CLUSTERED
    (
     [blood_type_id] ASC
        )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

-- Create the DonationStatus table

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonationStatus](
                                       [status_id] [int] NOT NULL,
                                       [status_name] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DonationStatus] ADD  CONSTRAINT [PK_DonationStatus] PRIMARY KEY CLUSTERED
    (
     [status_id] ASC
        )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


-- Create the Patient table

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
                                [patient_id] [int] IDENTITY(11500,1) NOT NULL,
                                [patient_firstname] [nvarchar](50) NOT NULL,
                                [patient_mi] [nchar](1) NULL,
                                [patient_lastname] [nvarchar](50) NOT NULL,
                                [patient_date_of_birth] [date] NOT NULL,
                                [patient_gender] [nchar](1) NOT NULL,
                                [patient_bloodtype_id] [smallint] NOT NULL,
                                [patient_phone_number] [nvarchar](15) NOT NULL,
                                [patient_email] [nvarchar](50) NULL,
                                [patient_ec_name] [nvarchar](50) NOT NULL,
                                [patient_ec_relationship] [nvarchar](50) NOT NULL,
                                [patient_ec_phone_number] [nvarchar](15) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Patient] ADD  CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED
    (
     [patient_id] ASC
        )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


-- Create the Staff table

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
                              [staff_id] [int] IDENTITY(170,1) NOT NULL,
                              [staff_firstname] [nvarchar](50) NOT NULL,
                              [staff_mi] [nchar](1) NULL,
                              [staff_lastname] [nvarchar](50) NOT NULL,
                              [staff_position] [nvarchar](50) NOT NULL,
                              [staff_phone_number] [nvarchar](15) NOT NULL,
                              [staff_email] [nvarchar](50) NOT NULL,
                              [blood_bank_id] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staff] ADD  CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED
    (
     [staff_id] ASC
        )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_BloodBank] FOREIGN KEY([blood_bank_id])
    REFERENCES [dbo].[BloodBank] ([blood_bank_id])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_BloodBank]
GO


-- Create the Donation table

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donation](
                                 [donation_id] [int] IDENTITY(1000,1) NOT NULL,
                                 [patient_id] [int] NOT NULL,
                                 [donation_date] [date] NOT NULL,
                                 [quantity_donated] [int] NOT NULL,
                                 [blood_type_id] [int] NOT NULL,
                                 [donation_status] [int] NOT NULL,
                                 [staff_id] [int] NOT NULL,
                                 [blood_bank_id] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Donation] ADD  CONSTRAINT [PK_Donation] PRIMARY KEY CLUSTERED
    (
     [donation_id] ASC
        )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Donation] ADD  CONSTRAINT [DEFAULT_Donation_donation_status]  DEFAULT ((1)) FOR [donation_status]
GO
ALTER TABLE [dbo].[Donation]  WITH CHECK ADD  CONSTRAINT [FK_Donation_BloodBank] FOREIGN KEY([blood_bank_id])
    REFERENCES [dbo].[BloodBank] ([blood_bank_id])
GO
ALTER TABLE [dbo].[Donation] CHECK CONSTRAINT [FK_Donation_BloodBank]
GO
ALTER TABLE [dbo].[Donation]  WITH CHECK ADD  CONSTRAINT [FK_Donation_BloodTypes] FOREIGN KEY([blood_type_id])
    REFERENCES [dbo].[BloodTypes] ([blood_type_id])
GO
ALTER TABLE [dbo].[Donation] CHECK CONSTRAINT [FK_Donation_BloodTypes]
GO
ALTER TABLE [dbo].[Donation]  WITH CHECK ADD  CONSTRAINT [FK_Donation_DonationStatus] FOREIGN KEY([donation_status])
    REFERENCES [dbo].[DonationStatus] ([status_id])
GO
ALTER TABLE [dbo].[Donation] CHECK CONSTRAINT [FK_Donation_DonationStatus]
GO
ALTER TABLE [dbo].[Donation]  WITH CHECK ADD  CONSTRAINT [FK_Donation_Patient] FOREIGN KEY([patient_id])
    REFERENCES [dbo].[Patient] ([patient_id])
GO
ALTER TABLE [dbo].[Donation] CHECK CONSTRAINT [FK_Donation_Patient]
GO
ALTER TABLE [dbo].[Donation]  WITH CHECK ADD  CONSTRAINT [FK_Donation_Staff] FOREIGN KEY([staff_id])
    REFERENCES [dbo].[Staff] ([staff_id])
GO
ALTER TABLE [dbo].[Donation] CHECK CONSTRAINT [FK_Donation_Staff]
GO

-- Create the Transfusion table

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transfusion](
                                    [transfusion_id] [int] IDENTITY(1500,1) NOT NULL,
                                    [patient_id] [int] NOT NULL,
                                    [transfusion_date] [date] NOT NULL,
                                    [quantity_transfused] [int] NOT NULL,
                                    [blood_type_id] [int] NOT NULL,
                                    [donation_id] [int] NOT NULL,
                                    [staff_id] [int] NOT NULL,
                                    [blood_bank_id] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Transfusion] ADD  CONSTRAINT [PK_Transfusion] PRIMARY KEY CLUSTERED
    (
     [transfusion_id] ASC
        )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Transfusion]  WITH CHECK ADD  CONSTRAINT [FK_Transfusion_BloodBank] FOREIGN KEY([blood_bank_id])
    REFERENCES [dbo].[BloodBank] ([blood_bank_id])
GO
ALTER TABLE [dbo].[Transfusion] CHECK CONSTRAINT [FK_Transfusion_BloodBank]
GO
ALTER TABLE [dbo].[Transfusion]  WITH CHECK ADD  CONSTRAINT [FK_Transfusion_BloodTypes] FOREIGN KEY([blood_type_id])
    REFERENCES [dbo].[BloodTypes] ([blood_type_id])
GO
ALTER TABLE [dbo].[Transfusion] CHECK CONSTRAINT [FK_Transfusion_BloodTypes]
GO
ALTER TABLE [dbo].[Transfusion]  WITH CHECK ADD  CONSTRAINT [FK_Transfusion_Donation] FOREIGN KEY([donation_id])
    REFERENCES [dbo].[Donation] ([donation_id])
GO
ALTER TABLE [dbo].[Transfusion] CHECK CONSTRAINT [FK_Transfusion_Donation]
GO
ALTER TABLE [dbo].[Transfusion]  WITH CHECK ADD  CONSTRAINT [FK_Transfusion_Patient] FOREIGN KEY([patient_id])
    REFERENCES [dbo].[Patient] ([patient_id])
GO
ALTER TABLE [dbo].[Transfusion] CHECK CONSTRAINT [FK_Transfusion_Patient]
GO
ALTER TABLE [dbo].[Transfusion]  WITH CHECK ADD  CONSTRAINT [FK_Transfusion_Staff] FOREIGN KEY([staff_id])
    REFERENCES [dbo].[Staff] ([staff_id])
GO
ALTER TABLE [dbo].[Transfusion] CHECK CONSTRAINT [FK_Transfusion_Staff]
GO

-- Create the stored procedures