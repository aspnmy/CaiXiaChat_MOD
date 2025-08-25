/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_TrashTalk : GComponent
    {
        public GList m_n0;
        public const string URL = "ui://gfenp5kwifju10r";

        public static UI_TrashTalk CreateInstance()
        {
            return (UI_TrashTalk)UIPackage.CreateObject("CaiXiaChat", "TrashTalk");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_n0 = (GList)GetChildAt(0);
        }
    }
}