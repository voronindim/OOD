//
// Created by Dmitrii Voronin on 19.09.2020.
//
#pragma once
#include "Beverage.h"

class CTea: public CBeverage
{
public:
    CTea(const std::string& description = "Tea")
        : CBeverage(description)
    {
    }

    [[nodiscard]] double GetCost() const override
    {
        return 30;
    }
};

class CBlackTea: public CTea
{
public:
    CBlackTea()
        : CTea("Black Tea")
    {}
};

class CRedTea: public CTea
{
public:
    CRedTea()
            : CTea("Red Tea")
    {}
};

class CWhiteTea: public  CTea
{
public:
    CWhiteTea()
            : CTea("White Tea")
    {}
};

class CGreenTea: public CTea
{
public:
    CGreenTea()
            : CTea("Green Tea")
    {}
};