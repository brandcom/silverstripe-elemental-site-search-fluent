# SilverStripe Elemental Site Search Module with Fluent support
Basic site search for the SilverStripe Elemental module. It works by saving a text reprentation of the elemental area to an extra field in SiteTree. This version works in a multilanguage setup based on Fluent.

## Requires

* [SilverStripe](https://www.silverstripe.org/)
* [SilverStripe Elemental](https://github.com/dnadesign/silverstripe-elemental)
* [Fluent](https://github.com/tractorcow-farm/silverstripe-fluent)

## Usage

### Install this module with composer

    composer require brandcom/silverstripe-elemental-site-search-fluent

Make sure you don't have `FulltextSearchable` enabled in `_config.php`.

### Dev/build

A few indexes need to be added to the database. This is done by running a dev/build.

### Add the search form

To add the search form, add `$SearchForm` anywhere in your template.

For example in Header.ss

    ...
    <div class="search-form">
        $SearchForm
    </div>
    ...

### Override the template (optional)

Lastly you can override the template for the result page if needed.

Copy

vendor/brandcom/silverstripe-elemental-site-search-fluent/templates/Layout/Page_results.ss

to your template folder, for example:

app/templates/Layout/Page_results.ss

and modify according to your needs.

### Clear caches

Then finally add ?flush=1 to the URL and you should see the new template.
