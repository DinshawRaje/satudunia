module Shapado
  module Controllers
    module Routes
      def self.included(base)
        base.class_eval do
          helper_method :logo_path, :css_group_path,
                        :favicon_group_path, :tag_icon_path,
                        :avatar_user_path,
                        :news_image_path,
                        :logo_group_path,
                        :question_attachment_path,
                        :javascript_group_path,
                        :bg_image_path,
			                  :shortcut_group_path,
                        :apple_group_path,
                        :applest_group_path,
                        :metro_group_path,
                        :announcement_image_path
        end
      end

      def javascript_group_path(group, theme_id, theme_version)
        "/_files/themes/javascript/#{CGI.escape(group.id)}/#{theme_id}/#{theme_version}.js"
      end

      def css_group_path(group, theme_id, theme_version)
        "/_files/themes/css/#{CGI.escape(group.id)}/#{theme_id}/#{theme_version}.css"
      end

      def bg_image_path(group, theme_id, theme_version)
        "/_files/themes/bg_image/#{CGI.escape(group.id)}/#{theme_id}/#{theme_version}.png"
      end

      def favicon_group_path(group)
        "/_files/groups/favicon/#{CGI.escape(group.id)}/#{group.custom_favicon_version}.png"
      end
      def shortcut_group_path(group)
        "/_files/groups/shortcut/#{CGI.escape(group.id)}/#{group.custom_favicon_version}.png"
      end
      def apple_group_path(group)
        "/_files/groups/apple/#{CGI.escape(group.id)}/#{group.custom_favicon_version}.png"
      end
      def applest_group_path(group)
        "/_files/groups/applest/#{CGI.escape(group.id)}/#{group.custom_favicon_version}.png"
      end
      def metro_group_path(group)
        "/_files/groups/metro/#{CGI.escape(group.id)}/#{group.custom_favicon_version}.png"
      end
      def tag_icon_path(group,tag_name)
        if tag_name.is_a?(Tag)
          tag_name = tag_name.name
        end
        "/_files/tags/icon/#{CGI.escape(group.id)}/#{tag_name}.png"
      end

      def avatar_user_path(user, size = nil)
        prefix = "avatar"
        if !size.nil? && ["big", "medium", "small"].include?(size)
          prefix = size
        end
        "/_files/users/#{prefix}/#{CGI.escape(user.id)}.png"
      end

      def logo_path(group, size = nil)
        prefix = "logo"
        if !size.nil? && ["big", "medium", "small"].include?(size)
          prefix = size
        end
        "/_files/groups/#{prefix}/#{CGI.escape(group.id)}/#{group.logo_version}.png"
      end

      def news_image_path(news, size = nil)
        prefix = "news_image"
        if !size.nil? && ["big", "medium", "small"].include?(size)
          prefix = size
        end

        "/_files/news/#{prefix}/#{CGI.escape(news.id.to_s)}.png"
      end

      def announcement_image_path(announcement, size = nil)
        prefix = "announcement_image"
        if !size.nil? && ["big", "medium", "small"].include?(size)
          prefix = size
        end

        "/_files/announcement/#{prefix}/#{CGI.escape(announcement.id.to_s)}.png"
      end

      def question_attachment_path(group,question, file, attach_id)
        "/_files/questions/attachment/#{group.slug}/#{CGI.escape(question.id)}/#{attach_id}/#{file.name}"
      end
    end
  end
end
