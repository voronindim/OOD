//
// Created by Dmitrii Voronin on 18.10.2020.
//
#pragma once
#include "CAbstractCommand.h"
#include <string>

using namespace std;

class CChangeTitleCommand : public CAbstractCommand
{
public:
    CChangeTitleCommand(string& target, string  newValue);

protected:
    void DoExecute() override;
    void DoUnexecute() override;

private:
    void SwapValues();

    string m_newValue;
    string& m_target;
};

