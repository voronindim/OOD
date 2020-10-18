//
// Created by Dmitrii Voronin on 18.10.2020.
//

#include "CChangeTitleCommand.h"
#include <utility>

CChangeTitleCommand::CChangeTitleCommand(string &target, string newValue)
        : m_target(target)
        , m_newValue(std::move(newValue))
{
}

void CChangeTitleCommand::DoExecute() {
    SwapValues();
}

void CChangeTitleCommand::DoUnexecute() {
    SwapValues();
}

void CChangeTitleCommand::SwapValues() {
    m_newValue.swap(m_target);
}


