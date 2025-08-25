/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_TextArea_WelcomeText : GLabel
    {
        public GImage m_n0;
        public GTextInput m_title;
        public const string URL = "ui://gfenp5kwimmyzk";

        public static UI_TextArea_WelcomeText CreateInstance()
        {
            return (UI_TextArea_WelcomeText)UIPackage.CreateObject("CaiXiaChat", "TextArea_WelcomeText");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_n0 = (GImage)GetChildAt(0);
            m_title = (GTextInput)GetChildAt(1);
        }
    }
}