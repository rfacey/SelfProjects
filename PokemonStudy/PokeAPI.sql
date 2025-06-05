USE PokeAPI
GO

CREATE TABLE dbo.PokeDex (
    PokeDexID BIGINT NOT NULL,
    PokemonName VARCHAR(MAX) NULL,
    LoadDate DATETIME NULL,
	LastModifiedDate DATETIME NULL
)
GO

CREATE TABLE dbo.PokemonSpecies (
    PokeDexID BIGINT NOT NULL,
    PokemonDescription VARCHAR(MAX) NULL,
	LoadDate DATETIME NULL,
	LastModifiedDate DATETIME NULL
)
GO