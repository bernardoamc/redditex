defmodule Redditex.FormatterTest do
  use ExUnit.Case

  import ExUnit.CaptureIO
  import Redditex.Formatter

  test "results are formated as expected" do
    assert capture_io(fn ->
      display({:ok, test_data_example})
    end) ==
      """
      ------------------------------
      Title: 2016 /r/bjj Patch Design Contest - Act Two...
      URL: https://www.reddit.com/r/bjj/comments/4n3vap/2016_rbjj_patch_design_contest_act_two/
      Permalink: https://www.reddit.com/r/bjj/comments/4n3vap/2016_rbjj_patch_design_contest_act_two/
      ------------------------------
      Title: Promoted to Blue after a class with Bjj legend Roger Gracie!
      URL: http://imgur.com/ISRPu3f
      Permalink: https://www.reddit.com/r/bjj/comments/4nlyo6/promoted_to_blue_after_a_class_with_bjj_legend/
      ------------------------------
      """
  end

  defp test_data_example do
    """
    {
      "kind": "Listing",
      "data": {
        "modhash": "",
        "children": [{
          "kind": "t3",
          "data": {
            "domain": "self.bjj",
            "banned_by": null,
            "media_embed": {},
            "subreddit": "bjj",
            "likes": null,
            "suggested_sort": null,
            "user_reports": [],
            "secure_media": null,
            "link_flair_text": null,
            "id": "4n3vap",
            "from_kind": null,
            "gilded": 0,
            "archived": false,
            "clicked": false,
            "report_reasons": null,
            "author": "katamusprime",
            "media": null,
            "score": 19,
            "approved_by": null,
            "over_18": false,
            "hidden": false,
            "num_comments": 54,
            "thumbnail": "self",
            "subreddit_id": "t5_2qn02",
            "hide_score": false,
            "edited": 1465400618.0,
            "link_flair_css_class": null,
            "author_flair_css_class": "blue-belt",
            "downs": 0,
            "secure_media_embed": {},
            "saved": false,
            "removal_reason": null,
            "post_hint": "self",
            "stickied": true,
            "from": null,
            "is_self": true,
            "from_id": null,
            "permalink": "/r/bjj/comments/4n3vap/2016_rbjj_patch_design_contest_act_two/",
            "locked": false,
            "name": "t3_4n3vap",
            "created": 1465399940.0,
            "url": "https://www.reddit.com/r/bjj/comments/4n3vap/2016_rbjj_patch_design_contest_act_two/",
            "author_flair_text": "New Orleans Service Industry Ninjas Anonymous",
            "quarantine": false,
            "title": "2016 /r/bjj Patch Design Contest - Act Two...",
            "created_utc": 1465371140.0,
            "distinguished": null,
            "mod_reports": [],
            "visited": false,
            "num_reports": null,
            "ups": 19
          }
        }, {
          "kind": "t3",
          "data": {
            "domain": "imgur.com",
            "banned_by": null,
            "media_embed": {},
            "subreddit": "bjj",
            "selftext_html": null,
            "selftext": "",
            "likes": null,
            "suggested_sort": null,
            "user_reports": [],
            "secure_media": null,
            "link_flair_text": "Image/GIF",
            "id": "4nlyo6",
            "from_kind": null,
            "gilded": 0,
            "archived": false,
            "clicked": false,
            "report_reasons": null,
            "author": "MaxBondMMA",
            "media": null,
            "score": 87,
            "approved_by": null,
            "over_18": false,
            "hidden": false,
            "num_comments": 24,
            "thumbnail": "http://b.thumbs.redditmedia.com/BBPxK5vZqCGy9D9ldqMlcWHjTpCP0pbXS7jmVs14cFM.jpg",
            "subreddit_id": "t5_2qn02",
            "hide_score": false,
            "edited": false,
            "link_flair_css_class": "image",
            "author_flair_css_class": "blue-belt",
            "downs": 0,
            "secure_media_embed": {},
            "saved": false,
            "removal_reason": null,
            "post_hint": "link",
            "stickied": false,
            "from": null,
            "is_self": false,
            "from_id": null,
            "permalink": "/r/bjj/comments/4nlyo6/promoted_to_blue_after_a_class_with_bjj_legend/",
            "locked": false,
            "name": "t3_4nlyo6",
            "created": 1465689792.0,
            "url": "http://imgur.com/ISRPu3f",
            "author_flair_text": "",
            "quarantine": false,
            "title": "Promoted to Blue after a class with Bjj legend Roger Gracie!",
            "created_utc": 1465660992.0,
            "distinguished": null,
            "mod_reports": [],
            "visited": false,
            "num_reports": null,
            "ups": 87
          }
        }
      ]}
    }
    """
  end
end
