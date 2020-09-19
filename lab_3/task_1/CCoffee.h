//
// Created by Dmitrii Voronin on 19.09.2020.
//


#pragma once
#include <iostream>
#include <string>
#include "Beverage.h"

enum class CoffeePortionType
{
    Standart,
    Double,
};

class CCoffee: public  CBeverage
{
public:

    CCoffee(const std::string& description = "Coffee")
        : CBeverage(description)
    {
    }

    [[nodiscard]] double GetCost() const override
    {
        return 60;
    }
};

class CCappuccino: public CCoffee
{
public:
    CCappuccino(CoffeePortionType portionType = CoffeePortionType::Standart)
        : CCoffee("Cappuccino Standart")
        , m_portionType(portionType)
    {
        if (portionType == CoffeePortionType::Double) {
            m_description = "Double Cappuccino";
        }
    }

    [[nodiscard]] double GetCost() const override
    {
        if (m_portionType == CoffeePortionType::Double)
        {
            return 120;
        }
        return 80;
    }

private:
    CoffeePortionType m_portionType;
};

class CLatte: public CCoffee
{
public:
    CLatte(CoffeePortionType portionType = CoffeePortionType::Standart)
    : CCoffee("Latte Standart")
    , m_portionType(portionType)
            {
                    if (portionType == CoffeePortionType::Double) {
                        m_description = "Double Latte";
                    }
            }

    [[nodiscard]] double GetCost() const override
    {
        if (m_portionType == CoffeePortionType::Double)
        {
            return 130;
        }
        return 90;
    }
private:
    CoffeePortionType m_portionType;
};
