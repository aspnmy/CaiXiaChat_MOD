/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_ComboBox : GComboBox
    {
        public Controller m_button;
        public GImage m_n1;
        public GImage m_n2;
        public GImage m_n3;
        public GTextField m_title;
        public const string URL = "ui://gfenp5kwnhnmk5";

        public static UI_ComboBox CreateInstance()
        {
            return (UI_ComboBox)UIPackage.CreateObject("CaiXiaChat", "ComboBox");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_button = GetControllerAt(0);
            m_n1 = (GImage)GetChildAt(0);
            m_n2 = (GImage)GetChildAt(1);
            m_n3 = (GImage)GetChildAt(2);
            m_title = (GTextField)GetChildAt(3);
        }
    }
}