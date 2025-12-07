// get the ninja-keys element
const ninja = document.querySelector('ninja-keys');

// add the home and posts menu items
ninja.data = [{
    id: "nav-about",
    title: "About",
    section: "Navigation",
    handler: () => {
      window.location.href = "/";
    },
  },{id: "nav-biography",
          title: "Biography",
          description: "",
          section: "Navigation",
          handler: () => {
            window.location.href = "/bio/";
          },
        },{id: "nav-news",
          title: "News",
          description: "",
          section: "Navigation",
          handler: () => {
            window.location.href = "/news/";
          },
        },{id: "nav-publications",
          title: "Publications",
          description: "",
          section: "Navigation",
          handler: () => {
            window.location.href = "/publications/";
          },
        },{id: "nav-cv",
          title: "CV",
          description: "",
          section: "Navigation",
          handler: () => {
            window.location.href = "/cv/";
          },
        },{id: "nav-teaching",
          title: "Teaching",
          description: "",
          section: "Navigation",
          handler: () => {
            window.location.href = "/teaching/";
          },
        },{id: "news-i-have-started-a-new-job-as-a-research-associate-at-the-university-of-sheffield",
          title: 'I have started a new job as a Research Associate at the University...',
          description: "",
          section: "News",},{id: "news-i-passed-my-phd-viva-with-minor-corrections-sparkles-smile",
          title: 'I passed my PhD viva with minor corrections! :sparkles: :smile:',
          description: "",
          section: "News",},{id: "news-this-website-is-finally-up-and-running",
          title: 'This website is finally up and running!',
          description: "",
          section: "News",},{id: "news-i-ve-been-selected-as-a-participant-for-the-11th-heidelberg-laureate-forum-in-september-this-year-looking-forward-to-sharing-more-about-the-event-later-in-the-year",
          title: 'I’ve been selected as a participant for the 11th Heidelberg Laureate Forum in...',
          description: "",
          section: "News",},{id: "news-i-ve-been-officially-approved-for-my-phd-degree-following-approval-of-minor-corrections-and-final-submission",
          title: 'I’ve been officially approved for my PhD degree, following approval of minor corrections...',
          description: "",
          section: "News",},{id: "news-i-was-invited-to-give-a-talk-on-my-phd-work-at-a-europroofnet-workshop-on-proof-systems-for-mathematics-and-verification-at-epfl-great-event-thank-you-very-much-to-the-organisers-for-hosting-and-the-invitation",
          title: 'I was invited to give a talk on my PhD work at a...',
          description: "",
          section: "News",},{id: "news-i-attended-the-11th-heidelberg-laureates-forum-at-the-end-of-september-an-amazing-week-of-learning-networking-and-great-conversations-as-part-of-the-event-i-was-also-selected-to-be-one-of-30-young-researchers-to-participate-in-the-poster-flash-session-a-cool-opportunity-to-present-my-phd-work-in-a-new-and-widely-accessible-way-my-two-minute-flash-talk-from-the-session-is-available-online",
          title: 'I attended the 11th Heidelberg Laureates Forum at the end of September -...',
          description: "",
          section: "News",},{id: "news-i-m-officially-a-dr-my-phd-was-awarded-during-the-cambridge-october-graduation-ceremonies",
          title: 'I’m officially a Dr! My PhD was awarded during the Cambridge October graduation...',
          description: "",
          section: "News",},{id: "news-i-m-on-the-programme-committee-for-itp2025-the-conference-will-be-in-iceland-from-the-27th-of-september-to-3rd-of-october-and-the-call-for-papers-is-now-live-on-the-conference-website",
          title: 'I’m on the programme committee for ITP2025! The conference will be in Iceland...',
          description: "",
          section: "News",},{id: "news-i-ll-be-a-lecturer-at-this-years-midlands-graduate-school-mgs-registration-is-now-open-for-more-information-see-the-mgs-website-information-on-my-course-will-be-provided-here",
          title: 'I’ll be a lecturer at this years Midlands Graduate School (MGS). Registration is...',
          description: "",
          section: "News",},{id: "news-i-was-invited-to-give-a-talk-on-formalised-mathematics-in-isabelle-hol-at-heidelberg-university-as-part-of-their-research-seminar-series-on-formal-mathematics-thank-you-to-florent-schaffhauser-and-judith-ludwig-for-hosting-exciting-to-also-hear-about-some-of-the-current-work-in-that-group-and-to-continue-to-see-formal-maths-becoming-a-central-part-of-mathematics-departments",
          title: 'I was invited to give a talk on Formalised Mathematics in Isabelle/HOL at...',
          description: "",
          section: "News",},{id: "news-i-m-looking-forward-to-being-a-lecturer-at-the-anu-logic-summer-school-in-december-this-year-an-abstract-for-my-course-is-now-available-on-the-website-and-registration-is-open",
          title: 'I’m looking forward to being a lecturer at the ANU Logic Summer School...',
          description: "",
          section: "News",},{id: "news-i-ve-accepted-a-continuing-position-as-a-lecturer-equiv-assistant-professor-at-the-university-of-western-australia-and-will-be-starting-in-november-very-excited-to-be-moving-home-to-australia-after-6-incredible-years-in-the-uk-and-thankful-to-all-those-who-supported-me-to-get-here",
          title: 'I’ve accepted a continuing position as a Lecturer (equiv. Assistant Professor) at the...',
          description: "",
          section: "News",},{id: "news-today-was-my-last-day-as-a-postdoc-at-the-university-of-sheffield-thank-you-to-all-my-friends-and-colleagues-in-the-sheffield-department-of-computer-science-for-their-support-over-the-last-two-years",
          title: 'Today was my last day as a postdoc at the University of Sheffield....',
          description: "",
          section: "News",},{id: "news-i-ve-started-my-new-position-as-a-lecturer-in-the-department-of-computer-science-and-software-engineering-at-the-university-of-western-australia-my-new-work-web-page-and-contact-details-are-available-here",
          title: 'I’ve started my new position as a Lecturer in the Department of Computer...',
          description: "",
          section: "News",},{id: "news-i-m-on-the-review-committee-for-pldi-2026-the-conference-will-be-in-colorado-from-the-15th-to-19th-of-june-and-the-final-call-for-papers-is-on-the-conference-website",
          title: 'I’m on the review committee for PLDI 2026. The conference will be in...',
          description: "",
          section: "News",},{id: "news-two-papers-from-my-postdoc-were-published-this-week-a-jar-paper-on-relative-security-for-reasoning-on-spectre-like-vulnerabilities-in-isabelle-hol-and-an-ifm-2025-paper-on-model-checking-buffered-durable-linearizability-for-concurrent-data-structures-in-non-volatile-memory-environments",
          title: 'Two papers from my postdoc were published this week! A JAR paper on...',
          description: "",
          section: "News",},{
        id: 'social-bluesky',
        title: 'Bluesky',
        section: 'Socials',
        handler: () => {
          window.open("https://bsky.app/profile/cledmonds.bsky.social", "_blank");
        },
      },{
        id: 'social-email',
        title: 'email',
        section: 'Socials',
        handler: () => {
          window.open("mailto:%63%68%65%6C%73%65%61.%65%64%6D%6F%6E%64%73@%75%77%61.%65%64%75.%61%75", "_blank");
        },
      },{
        id: 'social-github',
        title: 'GitHub',
        section: 'Socials',
        handler: () => {
          window.open("https://github.com/cledmonds", "_blank");
        },
      },{
        id: 'social-linkedin',
        title: 'LinkedIn',
        section: 'Socials',
        handler: () => {
          window.open("https://www.linkedin.com/in/chelsea-edmonds94", "_blank");
        },
      },{
        id: 'social-orcid',
        title: 'ORCID',
        section: 'Socials',
        handler: () => {
          window.open("https://orcid.org/0000-0002-8559-9133", "_blank");
        },
      },{
        id: 'social-scholar',
        title: 'Google Scholar',
        section: 'Socials',
        handler: () => {
          window.open("https://scholar.google.com/citations?user=87Q0JKgAAAAJ", "_blank");
        },
      },{
        id: 'social-work',
        title: 'Work',
        section: 'Socials',
        handler: () => {
          window.open("https://research-repository.uwa.edu.au/en/persons/chelsea-edmonds/", "_blank");
        },
      },{
      id: 'light-theme',
      title: 'Change theme to light',
      description: 'Change the theme of the site to Light',
      section: 'Theme',
      handler: () => {
        setThemeSetting("light");
      },
    },
    {
      id: 'dark-theme',
      title: 'Change theme to dark',
      description: 'Change the theme of the site to Dark',
      section: 'Theme',
      handler: () => {
        setThemeSetting("dark");
      },
    },
    {
      id: 'system-theme',
      title: 'Use system default theme',
      description: 'Change the theme of the site to System Default',
      section: 'Theme',
      handler: () => {
        setThemeSetting("system");
      },
    },];
