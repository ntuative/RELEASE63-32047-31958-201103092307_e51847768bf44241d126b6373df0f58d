package
{
   import com.sulake.habbo.quest.HabboQuestEngine;
   import com.sulake.iid.IIDHabboQuestEngine;
   import mx.core.SimpleApplication;
   
   public class HabboQuestEngineCom extends SimpleApplication
   {
      
      public static var manifest:Class = HabboQuestEngineCom_manifest;
      
      public static var IIDHabboQuestEngine:Class = IIDHabboQuestEngine;
      
      public static var HabboQuestEngine:Class = HabboQuestEngine;
      
      public static const icon_active:Class = HabboQuestEngineCom_icon_active;
      
      public static const icon_complete:Class = HabboQuestEngineCom_icon_complete;
      
      public static const icon_quest_hidden:Class = HabboQuestEngineCom_icon_quest_hidden;
      
      public static const QuestCampaign:Class = HabboQuestEngineCom_QuestCampaign;
      
      public static const QuestCompletedDialog:Class = HabboQuestEngineCom_QuestCompletedDialog;
      
      public static const QuestEngineTabs:Class = HabboQuestEngineCom_QuestEngineTabs;
      
      public static const QuestEngine:Class = HabboQuestEngineCom_QuestEngine;
      
      public static const QuestEntityAccepted:Class = HabboQuestEngineCom_QuestEntityAccepted;
      
      public static const QuestEntityAvailable:Class = HabboQuestEngineCom_QuestEntityAvailable;
      
      public static const QuestEntityCompleted:Class = HabboQuestEngineCom_QuestEntityCompleted;
      
      public static const QuestEntityExpired:Class = HabboQuestEngineCom_QuestEntityExpired;
      
      public static const QuestEntityPreview:Class = HabboQuestEngineCom_QuestEntityPreview;
      
      public static const QuestHelp:Class = HabboQuestEngineCom_QuestHelp;
      
      public static const QuestTypeFindStuff:Class = HabboQuestEngineCom_QuestTypeFindStuff;
      
      public static const QuestTypeGiveBadge:Class = HabboQuestEngineCom_QuestTypeGiveBadge;
       
      
      public function HabboQuestEngineCom()
      {
         super();
      }
   }
}
