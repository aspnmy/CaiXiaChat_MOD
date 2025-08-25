/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_TextArea_pw : GLabel
    {
        public GImage m_n0;
        public GTextInput m_title;
        public const string URL = "ui://gfenp5kwsm1yf";

        public static UI_TextArea_pw CreateInstance()
        {
            return (UI_TextArea_pw)UIPackage.CreateObject("CaiXiaChat", "TextArea_pw");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_n0 = (GImage)GetChildAt(0);
            m_title = (GTextInput)GetChildAt(1);
        }
    }
}