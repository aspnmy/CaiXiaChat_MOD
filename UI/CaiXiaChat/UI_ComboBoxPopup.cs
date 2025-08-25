/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_ComboBoxPopup : GComponent
    {
        public GImage m_n0;
        public GList m_list;
        public const string URL = "ui://gfenp5kwnhnmk6";

        public static UI_ComboBoxPopup CreateInstance()
        {
            return (UI_ComboBoxPopup)UIPackage.CreateObject("CaiXiaChat", "ComboBoxPopup");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_n0 = (GImage)GetChildAt(0);
            m_list = (GList)GetChildAt(1);
        }
    }
}