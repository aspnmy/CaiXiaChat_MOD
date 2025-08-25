/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_TextArea2 : GComponent
    {
        public GTextInput m_title;
        public const string URL = "ui://gfenp5kwbvf5a";

        public static UI_TextArea2 CreateInstance()
        {
            return (UI_TextArea2)UIPackage.CreateObject("CaiXiaChat", "TextArea2");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_title = (GTextInput)GetChildAt(0);
        }
    }
}