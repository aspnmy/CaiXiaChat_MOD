/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_TextArea3 : GLabel
    {
        public GTextField m_title;
        public const string URL = "ui://gfenp5kwnhnmk9";

        public static UI_TextArea3 CreateInstance()
        {
            return (UI_TextArea3)UIPackage.CreateObject("CaiXiaChat", "TextArea3");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_title = (GTextField)GetChildAt(0);
        }
    }
}