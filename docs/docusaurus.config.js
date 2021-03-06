module.exports = {
  title: 'GMS Websocket',
  tagline: 'Create multiplayer games through Websockets with GameMaker Studio',
  url: 'https://gamemaker-websocket.github.io',
  baseUrl: '/client/',
  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/logo.svg',
  organizationName: 'gamemaker-websocket',
  projectName: 'client',
  themeConfig: {
    navbar: {
      title: 'GWS',
      logo: {
        alt: 'GWS',
        src: 'img/logo.svg',
      },
      items: [
        {
          href: 'https://github.com/gamemaker-websocket/client',
          label: 'GitHub',
          position: 'right',
        },
      ],
    },
    footer: {
      style: 'dark',
      copyright: `Copyright © ${new Date().getFullYear()} Adriano Tumminelli & Manuel Di Iorio`,
    },
  },
  presets: [
    [
      '@docusaurus/preset-classic',
      {
        docs: {
          routeBasePath: '/',

          sidebarPath: require.resolve('./sidebars.js'),
          editUrl:
            'https://github.com/gamemaker-websocket/client/edit/master/docs',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      },
    ],
  ],
};
