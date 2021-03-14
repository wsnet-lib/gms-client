module.exports = {
  title: 'WSNET',
  tagline: 'Create multiplayer games through Websockets with GameMaker Studio and Unity',
  url: 'https://wsnet-lib.github.io',
  baseUrl: '/gms-client/',
  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/logo.svg',
  organizationName: 'wsnet-lib',
  projectName: 'client',
  themeConfig: {
    navbar: {
      title: 'WSNET',
      logo: {
        alt: 'WSNET',
        src: 'img/logo.svg',
      },
      items: [
        {
          href: 'https://github.com/wsnet-lib',
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
            'https://github.com/wsnet-lib/gms-client/edit/master/docs',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      },
    ],
  ],
};
