import { Routes } from '@angular/router';

export const routes: Routes = [
  {
    path: '',
    loadChildren: () => import('./../../libs/reports/src/lib/reports.routes').then(m => m.REPORTS_ROUTES),
  },
  {
    path: "**",
    loadChildren: () => import('./../../libs/reports/src/lib/reports.routes').then(m => m.REPORTS_ROUTES),
  }
];
