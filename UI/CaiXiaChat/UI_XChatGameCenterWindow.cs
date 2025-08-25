/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_CaiXiaChatGameCenterWindow : GComponent
    {
        public GLabel m_frame;
        public GList m_n1;
        public const string URL = "ui://gfenp5kwtrnyzo";

        public static UI_CaiXiaChatGameCenterWindow CreateInstance()
        {
            return (UI_CaiXiaChatGameCenterWindow)UIPackage.CreateObject("CaiXiaChat", "CaiXiaChatGameCenterWindow");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_frame = (GLabel)GetChildAt(0);
            m_n1 = (GList)GetChildAt(1);
        }
    }
}