<?php

namespace brandcom\ElementalSiteSearch;

use SilverStripe\Core\Extension;
use SilverStripe\ORM\DB;
use SilverStripe\Control\Director;

class DatabaseAdminExtension extends Extension
{
    public function onAfterBuild($quiet, $populate, $testMode)
    {
        if (!$quiet) {
            if (Director::is_cli()) {
                echo "\nCreating indexes for fluent site search\n\n";
            } else {
                echo "\n<p><b>Creating indexes for fluent site search</b></p>\n\n";
            }
        }

        $tables = ['SiteTree_Localised_Live', 'SiteTree_Localised', 'SiteTree_Localised_Versions'];
        $indexes = [
            'SearchFields' => 'Title, SearchContent, Keywords',
            'Title' => 'Title',
            'SearchContent' => 'SearchContent',
            'Keywords' => 'Keywords'
        ];

        foreach ($tables as $table) {
            foreach ($indexes as $index => $columns) {
                $res = DB::query('SHOW INDEX FROM ' . $table . ' WHERE Key_name = \'' . $index . '\'');
                if ($res->numRecords() < 1) {
                    DB::query('CREATE FULLTEXT INDEX ' . $index . ' ON ' . $table . ' (' . $columns . ')');
                }
            }
        }

        if (!$quiet) {
            if (Director::is_cli()) {
                echo "\n\n";
            } else {
                echo "\n<p><br></p>\n\n";
            }
        }
    }
}
