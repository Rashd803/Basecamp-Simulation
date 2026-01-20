using System;
using System.Collections.Generic;
using DataAccessLayer.Entities;
using Microsoft.EntityFrameworkCore;

namespace DataAccessLayer.Data;

public partial class AppDbContext : DbContext
{
    public AppDbContext()
    {
    }

    public AppDbContext(DbContextOptions<AppDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Activity> Activities { get; set; }

    public virtual DbSet<Answer> Answers { get; set; }

    public virtual DbSet<Assignment> Assignments { get; set; }

    public virtual DbSet<Card> Cards { get; set; }

    public virtual DbSet<Chat> Chats { get; set; }

    public virtual DbSet<Client> Clients { get; set; }

    public virtual DbSet<Column> Columns { get; set; }

    public virtual DbSet<CommentSubscription> CommentSubscriptions { get; set; }

    public virtual DbSet<Document> Documents { get; set; }

    public virtual DbSet<Event> Events { get; set; }

    public virtual DbSet<NoteFile> NotesFiles { get; set; }

    public virtual DbSet<Invitation> Invitations { get; set; }

    public virtual DbSet<InvitationStatus> InvitationStatuses { get; set; }

    public virtual DbSet<List> Lists { get; set; }

    public virtual DbSet<Member> Members { get; set; }

    public virtual DbSet<MessageBoard> MessageBoards { get; set; }

    public virtual DbSet<Note> Notes { get; set; }

    public virtual DbSet<Project> Projects { get; set; }

    public virtual DbSet<ProjectComment> ProjectComments { get; set; }

    public virtual DbSet<PublishingInformation> PublishingInformations { get; set; }

    public virtual DbSet<Question> Questions { get; set; }

    public virtual DbSet<Schedule> Schedules { get; set; }

    public virtual DbSet<ScheduleType> ScheduleTypes { get; set; }

    public virtual DbSet<Step> Steps { get; set; }

    public virtual DbSet<ToDo> ToDos { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<VwActivityByProjectId> VwActivityByProjectIds { get; set; }

    public virtual DbSet<VwActivityViewByProjectId> VwActivityViewByProjectIds { get; set; }

    public virtual DbSet<VwAnswerViewByQuestionId> VwAnswerViewByQuestionIds { get; set; }

    public virtual DbSet<VwAssignmentByElementId> VwAssignmentByElementIds { get; set; }

    public virtual DbSet<VwAssignmentViewByElementId> VwAssignmentViewByElementIds { get; set; }

    public virtual DbSet<VwCardViewByCardId> VwCardViewByCardIds { get; set; }

    public virtual DbSet<VwCardViewByColumnId> VwCardViewByColumnIds { get; set; }

    public virtual DbSet<VwChatViewByProjectId> VwChatViewByProjectIds { get; set; }

    public virtual DbSet<VwClient> VwClients { get; set; }

    public virtual DbSet<VwClientProject> VwClientProjects { get; set; }

    public virtual DbSet<VwColumnViewByColumnId> VwColumnViewByColumnIds { get; set; }

    public virtual DbSet<VwColumnViewByProjectId> VwColumnViewByProjectIds { get; set; }

    public virtual DbSet<VwCommentViewByElementId> VwCommentViewByElementIds { get; set; }

    public virtual DbSet<VwDocumentViewByDocumentId> VwDocumentViewByDocumentIds { get; set; }

    public virtual DbSet<VwDocumentViewByProjectId> VwDocumentViewByProjectIds { get; set; }

    public virtual DbSet<VwElementCommentView> VwElementCommentViews { get; set; }

    public virtual DbSet<VwEventViewByEventId> VwEventViewByEventIds { get; set; }

    public virtual DbSet<VwEventViewByProjectId> VwEventViewByProjectIds { get; set; }

    public virtual DbSet<VwFileByNoteId> VwFileByNoteIds { get; set; }

    public virtual DbSet<VwFileViewByNoteId> VwFileViewByNoteIds { get; set; }

    public virtual DbSet<VwInvitation> VwInvitations { get; set; }

    public virtual DbSet<VwInvitationProject> VwInvitationProjects { get; set; }

    public virtual DbSet<VwListViewByListId> VwListViewByListIds { get; set; }

    public virtual DbSet<VwListViewByProjectId> VwListViewByProjectIds { get; set; }

    public virtual DbSet<VwMember> VwMembers { get; set; }

    public virtual DbSet<VwMemberProject> VwMemberProjects { get; set; }

    public virtual DbSet<VwMessageBoard> VwMessageBoards { get; set; }

    public virtual DbSet<VwMessageBoardByMessageId> VwMessageBoardByMessageIds { get; set; }

    public virtual DbSet<VwMessageBoardByProjectId> VwMessageBoardByProjectIds { get; set; }

    public virtual DbSet<VwQuestionViewByProjectId> VwQuestionViewByProjectIds { get; set; }

    public virtual DbSet<VwQuestionViewByQuestionId> VwQuestionViewByQuestionIds { get; set; }

    public virtual DbSet<VwStepViewByCardId> VwStepViewByCardIds { get; set; }

    public virtual DbSet<VwToDoViewByListId> VwToDoViewByListIds { get; set; }

    public virtual DbSet<VwToDoViewByToDoId> VwToDoViewByToDoIds { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source = .; initial catalog = Basecamp; Integrated Security = SSPI; TrustServerCertificate = True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.ApplyConfigurationsFromAssembly(typeof(AppDbContext).Assembly);

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
