#include "AppModel.h"

AppModel* AppModel::m_instance = nullptr;

AppModel *AppModel::getIntance()
{
    if (nullptr == m_instance)
    {
        m_instance = new AppModel;
    }
    return m_instance;
}

AppModel::~AppModel()
{
    if (nullptr != m_instance)
    {
        delete m_instance;
    }
    m_instance = nullptr;
}

QString AppModel::bashrcText() const
{
    return m_bashrcText;
}

void AppModel::setBashrcText(QString bashrcText)
{
    if (m_bashrcText == bashrcText)
        return;

    m_bashrcText = bashrcText;
    emit bashrcTextChanged();
}


