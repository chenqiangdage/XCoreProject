using XCoreProject.Api.Repository.Base;
using XCoreProject.Api.Model.Models;
using XCoreProject.Api.IRepository;
using System.Collections.Generic;
using System.Threading.Tasks;
using SqlSugar;
using XCoreProject.Api.IRepository.UnitOfWork;

namespace XCoreProject.Api.Repository
{
    /// <summary>
    /// RoleModulePermissionRepository
    /// </summary>	
    public class RoleModulePermissionRepository : BaseRepository<RoleModulePermission>, IRoleModulePermissionRepository
    {
        public RoleModulePermissionRepository(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }

        public async Task<List<RoleModulePermission>> WithChildrenModel()
        {
            var list = await Task.Run(() => Db.Queryable<RoleModulePermission>()
                    .Mapper(it => it.Role, it => it.RoleId)
                    .Mapper(it => it.Permission, it => it.PermissionId)
                    .Mapper(it => it.Module, it => it.ModuleId).ToList());

            return null;
        }

        public async Task<List<TestMuchTableResult>> QueryMuchTable()
        {
            return await QueryMuch<RoleModulePermission, Module, Permission, TestMuchTableResult>(
                (rmp, m, p) => new object[] {
                    JoinType.Left, rmp.ModuleId == m.Id,
                    JoinType.Left,  rmp.PermissionId == p.Id
                },

                (rmp, m, p) => new TestMuchTableResult()
                {
                    moduleName = m.Name,
                    permName = p.Name,
                    rid = rmp.RoleId,
                    mid = rmp.ModuleId,
                    pid = rmp.PermissionId
                },

                (rmp, m, p) => rmp.IsDeleted == false
                );
        }

        /// <summary>
        /// ��ɫȨ��Map
        /// RoleModulePermission, Module, Role ��������
        /// ���ĸ����� RoleModulePermission �Ƿ���ֵ
        /// </summary>
        /// <returns></returns>
        public async Task<List<RoleModulePermission>> RoleModuleMaps()
        {
            return await QueryMuch<RoleModulePermission, Module, Role, RoleModulePermission>(
                (rmp, m, r) => new object[] {
                    JoinType.Left, rmp.ModuleId == m.Id,
                    JoinType.Left,  rmp.RoleId == r.Id
                },

                (rmp, m, r) => new RoleModulePermission()
                {
                    Role = r,
                    Module = m,
                    IsDeleted = rmp.IsDeleted
                },

                (rmp, m, r) => rmp.IsDeleted == false && m.IsDeleted == false && r.IsDeleted == false
                );
        }

    }

}

