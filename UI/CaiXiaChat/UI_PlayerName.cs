/** This is an automatically generated class by FairyGUI. Please do not modify it. **/

using FairyGUI;
using FairyGUI.Utils;

namespace CaiXiaChat
{
    public partial class UI_PlayerName : GComponent
    {
        public GTextField m_n0;
        public const string URL = "ui://gfenp5kwklau10j";

        public static UI_PlayerName CreateInstance()
        {
            return (UI_PlayerName)UIPackage.CreateObject("CaiXiaChat", "PlayerName");
        }

        public override void ConstructFromXML(XML xml)
        {
            base.ConstructFromXML(xml);

            m_n0 = (GTextField)GetChildAt(0);
        }
    }
}