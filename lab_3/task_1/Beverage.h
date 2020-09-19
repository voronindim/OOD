//
// Created by Dmitrii Voronin on 19.09.2020.
//
#pragma once
#include <iostream>
#include "IBeverage.h"

class CBeverage : public IBeverage
{
public:
    CBeverage(const std::string& description = "Unknown Beverage")
            : m_description(description)
    {
    }

    [[nodiscard]] std::string GetDescription() const override
    {
        return m_description;
    }

protected:
    std::string m_description;
};
