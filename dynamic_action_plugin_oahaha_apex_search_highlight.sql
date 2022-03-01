prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_190200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2019.10.04'
,p_release=>'19.2.0.00.18'
,p_default_workspace_id=>1660789381564079
,p_default_application_id=>969
,p_default_id_offset=>0
,p_default_owner=>'DG_APR'
);
end;
/
 
prompt APPLICATION 969 - WMS - Orange
--
-- Application Export:
--   Application:     969
--   Name:            WMS - Orange
--   Date and Time:   13:00 Tuesday March 1, 2022
--   Exported By:     ALEXANDRU.BASARAB@DIGI-SOFT.RO
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 64912146061244760
--   Manifest End
--   Version:         19.2.0.00.18
--   Instance ID:     108819688236962
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/dynamic_action/oahaha_apex_search_highlight
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(64912146061244760)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'OAHAHA.APEX.SEARCH.HIGHLIGHT'
,p_display_name=>'Oahaha APEX Search Highlight'
,p_category=>'STYLE'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'FUNCTION F_RENDER (',
'    P_DYNAMIC_ACTION   IN APEX_PLUGIN.T_DYNAMIC_ACTION,',
'    P_PLUGIN           IN APEX_PLUGIN.T_PLUGIN',
') RETURN APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT AS',
'    VR_RESULT         APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT;',
'BEGIN',
'    APEX_CSS.ADD_FILE(',
'        P_NAME        => ''css/oahaha.apex.highlight'',',
'        P_DIRECTORY   => P_PLUGIN.FILE_PREFIX,',
'        P_VERSION     => NULL,',
'        P_KEY         => ''oahaha.apex.highlight''',
'    );',
'',
'    VR_RESULT.JAVASCRIPT_FUNCTION   := ''',
'    function () { ',
'        find = $(this.triggeringElement).val().toLowerCase();    ',
'',
'        $("''|| P_DYNAMIC_ACTION.ATTRIBUTE_01 ||''").each(function() {',
'            exists = $(this).text().toLowerCase().search(find);',
'            if ((exists != "-1" || exists == 0) && find != "") {',
'                $(this).addClass("''|| APEX_ESCAPE.HTML_ATTRIBUTE(P_DYNAMIC_ACTION.ATTRIBUTE_02) ||''");',
'            } else {',
'                $(this).removeClass("''|| APEX_ESCAPE.HTML_ATTRIBUTE(P_DYNAMIC_ACTION.ATTRIBUTE_02) ||''");',
'            }',
'        });',
'    }'';',
'',
'    RETURN VR_RESULT;',
'END;'))
,p_api_version=>2
,p_render_function=>'F_RENDER'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_files_version=>2
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(64912770041249082)
,p_plugin_id=>wwv_flow_api.id(64912146061244760)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'jQuery selector to be highlighted '
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
,p_help_text=>'Highlight element example .a-IRR-table td'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(64913044120253617)
,p_plugin_id=>wwv_flow_api.id(64912146061244760)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'CSS class of highlight'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'highlight-element'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
,p_help_text=>'You can use your defined class or use "highlight-element" that it''s defined in the plugin css file'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2E686967686C696768742D656C656D656E74207B0D0A202020206261636B67726F756E642D636F6C6F723A20677265656E2021696D706F7274616E743B0D0A20202020636F6C6F723A2077686974652021696D706F7274616E743B0D0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(64912418670245874)
,p_plugin_id=>wwv_flow_api.id(64912146061244760)
,p_file_name=>'css/oahaha.apex.highlight.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
