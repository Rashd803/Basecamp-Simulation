using DataAccessLayer.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;

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

 
    public virtual DbSet<ActivityByProjectIdDTO> VwActivityByProjectIds { get; set; }


    public virtual DbSet<AnswerByQuestionIdDTO> VwAnswerViewByQuestionIds { get; set; }

    public virtual DbSet<AssignmentByElementIdDTO> VwAssignmentByElementIds { get; set; }


    public virtual DbSet<CardByCardIdDTO> VwCardViewByCardIds { get; set; }

    public virtual DbSet<CardByColumnIdDTO> VwCardViewByColumnIds { get; set; }

    public virtual DbSet<ChatByProjectIdDTO> VwChatViewByProjectIds { get; set; }

    public virtual DbSet<ClientDTO> VwClients { get; set; }

    public virtual DbSet<ClientProjectDTO> VwClientProjects { get; set; }

    public virtual DbSet<ColumnByColumnIdDTO> VwColumnViewByColumnIds { get; set; }

    public virtual DbSet<ColumnByProjectIdDTO> VwColumnViewByProjectIds { get; set; }

    public virtual DbSet<CommentByElementIdDTO> VwCommentViewByElementIds { get; set; }

    public virtual DbSet<DocumentByDocumentIdDTO> VwDocumentViewByDocumentIds { get; set; }

    public virtual DbSet<DocumentByProjectIdDTO> VwDocumentViewByProjectIds { get; set; }

  
    public virtual DbSet<EventByEventIdDTO> VwEventViewByEventIds { get; set; }

    public virtual DbSet<EventByProjectIdDTO> VwEventViewByProjectIds { get; set; }

    public virtual DbSet<FileByNoteIdDTO> VwFileByNoteIds { get; set; }


    public virtual DbSet<InvitationDTO> VwInvitations { get; set; }

    public virtual DbSet<InvitationProjectDTO> VwInvitationProjects { get; set; }

    public virtual DbSet<ListByListIdDTO> VwListViewByListIds { get; set; }

    public virtual DbSet<ListByProjectIdDTO> VwListViewByProjectIds { get; set; }

    public virtual DbSet<MemberDTO> VwMembers { get; set; }

    public virtual DbSet<MemberProjectDTO> VwMemberProjects { get; set; }

   

   
    public virtual DbSet<MessageBoardByMessageIdDTO> VwMessageBoardByMessageIds { get; set; }

    public virtual DbSet<MessageBoardByProjectIdDTO> VwMessageBoardByProjectIds { get; set; }

    public virtual DbSet<QuestionByProjectIdDTO> VwQuestionViewByProjectIds { get; set; }

    public virtual DbSet<QuestionByQuestionIdDTO> VwQuestionViewByQuestionIds { get; set; }

    public virtual DbSet<StepByCardIdDTO> VwStepViewByCardIds { get; set; }

    public virtual DbSet<ToDoByListIdDTO> VwToDoViewByListIds { get; set; }

    public virtual DbSet<ToDoByToDoIdDTO> VwToDoViewByToDoIds { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        var configuration = new ConfigurationBuilder()
                .AddJsonFile("AppSettings.json")
                .Build();

        var connectionString = configuration.GetSection("ConnectionString").Value;

        optionsBuilder.UseSqlServer(connectionString);
    }
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.ApplyConfigurationsFromAssembly(typeof(AppDbContext).Assembly);

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
