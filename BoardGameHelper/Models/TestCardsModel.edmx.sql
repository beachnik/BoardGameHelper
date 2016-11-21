
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/21/2016 22:19:38
-- Generated from EDMX file: C:\Users\Nick\Source\Repos\BoardGameHelper\BoardGameHelper\Models\TestCardsModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [GamesDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[TestCards]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TestCards];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'TestCards'
CREATE TABLE [dbo].[TestCards] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CardName] varchar(50)  NOT NULL,
    [IsDrawn] bit  NOT NULL
);
GO

-- Creating table 'Cards'
CREATE TABLE [dbo].[Cards] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Text] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Cards_Asset'
CREATE TABLE [dbo].[Cards_Asset] (
    [Cost] int  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'Cards_Spell'
CREATE TABLE [dbo].[Cards_Spell] (
    [ReverseText] nvarchar(max)  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'TestCards'
ALTER TABLE [dbo].[TestCards]
ADD CONSTRAINT [PK_TestCards]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Cards'
ALTER TABLE [dbo].[Cards]
ADD CONSTRAINT [PK_Cards]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Cards_Asset'
ALTER TABLE [dbo].[Cards_Asset]
ADD CONSTRAINT [PK_Cards_Asset]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Cards_Spell'
ALTER TABLE [dbo].[Cards_Spell]
ADD CONSTRAINT [PK_Cards_Spell]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Id] in table 'Cards_Asset'
ALTER TABLE [dbo].[Cards_Asset]
ADD CONSTRAINT [FK_Asset_inherits_Card]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Cards]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Cards_Spell'
ALTER TABLE [dbo].[Cards_Spell]
ADD CONSTRAINT [FK_Spell_inherits_Card]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Cards]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------