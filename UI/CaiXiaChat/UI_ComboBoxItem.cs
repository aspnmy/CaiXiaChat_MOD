/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_ComboBoxItem : GButton
    {
        public Controller m_button;
        public GGraph m_n2;
        public GTextField m_title;
        public const string URL = "ui://gfenp5kwnhnmk7";

        public static UI_ComboBoxItem CreateInstance()
        {
            return (UI_ComboBoxItem)UIPackage.CreateObject("CaiXiaChat", "ComboBoxItem");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_button = GetControllerAt(0);
            m_n2 = (GGraph)GetChildAt(0);
            m_title = (GTextField)GetChildAt(1);
        }
    }
}